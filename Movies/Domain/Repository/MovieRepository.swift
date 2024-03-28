protocol MovieRepository{
    func getMovies() throws -> [Movie]
}
