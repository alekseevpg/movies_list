import SwiftUI

@MainActor
struct MovieListScreen: View {

    @Environment(AppCoordinator.self) private var coordinator

    @Bindable var viewModel: MovieListViewModel

    var body: some View {
        List {
            ForEach(viewModel.movies) { movie in
                Button {
                    coordinator.navigate(to: .movieDetails(movie: movie))
                } label: {
                    MovieCellView(movie: movie)
                }
            }
        }
        .listStyle(.inset)
        .listRowInsets(.none)
        .navigationTitle("Movies")
        .onAppear {
            viewModel.getMovies()
        }
        .alert(
            isPresented: $viewModel.moviesErrorPresented,
            error: viewModel.moviesError
        ) {
            Button("Ok") { }
        }
    }
}

#Preview {
    MovieListScreen(
        viewModel: MovieListViewModel(
            movieService: MovieService(
                repo: MovieJsonRepository()
            )
        )
    )
    .environment(AppCoordinator())
}
