import SwiftUI

enum Route: Hashable {
    case movieDetails(movie: Movie)
}

@Observable
class AppCoordinator {
    var path: [Route] = []

    func navigate(to destination: Route) {
        path.append(destination)
    }

    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .movieDetails(let movie):
            MovieDetailsScreen(movie: movie)
        }
    }
}
