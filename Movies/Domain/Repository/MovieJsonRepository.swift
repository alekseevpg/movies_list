import Foundation

class MovieJsonRepository: MovieRepository {
    private var movies: [Movie] = []

    private let fileName = "movies"
    private let fileExtension = "json"

    func getMovies() throws -> [Movie] {
        if movies.isEmpty {
            guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
                return []
            }
            let data = try Data(contentsOf: url)
            movies = try JSONDecoder().decode([Movie].self, from: data)
        }
        return movies
    }
}
