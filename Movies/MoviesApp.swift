import SwiftUI

@main
struct MoviesApp: App {
    @State private var coordinator = AppCoordinator()

    private let movieListViewModel: MovieListViewModel

    init() {
        let movieService = MovieService(repo: MovieJsonRepository())
        movieListViewModel = MovieListViewModel(movieService: movieService)
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                MovieListScreen(viewModel: movieListViewModel)
                    .navigationDestination(for: Route.self, destination: coordinator.view(for:))
            }
            .environment(coordinator)
        }
    }
}

