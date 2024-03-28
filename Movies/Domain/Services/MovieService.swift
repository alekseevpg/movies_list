import Foundation

class MovieService: MovieRepository {
    private let repo: MovieRepository

    init(repo: MovieRepository) {
        self.repo = repo
    }

    func getMovies() throws -> [Movie] {
        try repo.getMovies()
    }
}
