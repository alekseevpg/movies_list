import Foundation

class MovieJsonRepository: MovieRepository {

    private let fileName = "movies"
    private let fileExtension = "json"

    func getMovies() throws -> [Movie] {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            return []
        }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Movie].self, from: data)
    }
}
