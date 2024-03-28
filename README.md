Movie-Details view with Observable, MVVM and Clean principles


If project is built on XCode lower than 15.3 you might encounter a NavigationStack bug described here:
https://twitter.com/pointfreeco/status/1691496668573605892?s=20


Workaround for it would look like that


var body: some View {
    @Bindable var bindableModel = coordinator

    List {
        ForEach(viewModel.movies) { movie in
            Button {
                bindableModel.navigate(to: .movieDetails(movie: movie))
            } label: {
                MovieCellView(movie: movie)
            }
        }
    }
}