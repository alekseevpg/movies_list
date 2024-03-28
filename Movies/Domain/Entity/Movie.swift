import Foundation

struct Movie: Identifiable, Hashable, Decodable {
    let id = UUID()
    let title: String
    let year: String
    let genre: String
    let description: String
    let thumbURL: String

    enum CodingKeys: CodingKey {
        case title
        case year
        case genre
        case description
        case thumbURL
    }
}

extension Movie {
    static func placeholder() -> Movie {
        Movie(
            title: "Gentlemen",
            year: "2019",
            genre: "crime",
            description: "One cunning American has been dealing drugs since his student days, and now he has come up with a scheme for illegal enrichment using the estates of the impoverished English aristocracy and has become very rich from this. Another cunning journalist comes to Ray, the American's right-hand man, and offers him to buy a film script , which details the crimes of his boss with the participation of other representatives of the London criminal world - a Jewish partner, the Chinese diaspora, black athletes and even a Russian oligarch.",
            thumbURL: "https://image.openmoviedb.com/kinopoisk-images/1704946/e9008e2f-433f-43b0-b9b8-2ea8e3fb6c9b/x1000"
        )
    }
}
