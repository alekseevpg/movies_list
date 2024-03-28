import Foundation

class MovieJsonRepository: MovieRepository {
    private var movies: [Movie] = []

    func getMovies() throws -> [Movie] {
        if movies.isEmpty {
            guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else {
                return []
            }
            let data = try Data(contentsOf: url)
            movies = try JSONDecoder().decode([Movie].self, from: data)
        }
        return movies
    }
}
