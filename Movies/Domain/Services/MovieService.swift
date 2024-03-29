import Foundation

class MovieService {
    private let repo: MovieRepository
    private var movies: [Movie] = []

    init(repo: MovieRepository) {
        self.repo = repo
    }

    func getMovies() throws -> [Movie] {
        if movies.isEmpty {
            movies = try repo.getMovies()
        }
        return movies
    }
}
