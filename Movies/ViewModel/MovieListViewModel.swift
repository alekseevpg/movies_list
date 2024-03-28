import SwiftUI

@Observable
class MovieListViewModel {

    private let movieService: MovieService
    
    init(movieService: MovieService) {
        self.movieService = movieService
    }

    var movies: [Movie] = []
    var moviesErrorPresented: Bool = false
    var moviesError: MovieListError?

    func getMovies() {
        do {
            self.movies = try movieService.getMovies()
        } catch {
            moviesError = MovieListError.moviesParsingError(message: error.localizedDescription)
            moviesErrorPresented = true
        }
    }
}

enum MovieListError: LocalizedError {
    case moviesParsingError(message: String)

    var errorDescription: String? {
        switch self {
        case .moviesParsingError(let message):
            return message
        }
    }
}
