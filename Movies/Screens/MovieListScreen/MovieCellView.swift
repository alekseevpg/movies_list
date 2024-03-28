import SwiftUI
import NukeUI

@MainActor
struct MovieCellView: View {

    let movie: Movie
    
    var body: some View {
        HStack(alignment: .top) {
            LazyImage(url: URL(string: movie.thumbURL)) { state in
                if let image = state.image {
                    image
                        .resizable()
                        .foregroundStyle(.white)
                        .scaledToFit()
                } else if state.error != nil {
                    Color.red
                } else {
                    Rectangle()
                        .fill(Color.gray)
                        .overlay {
                            ProgressView()
                                .tint(.black)
                        }
                }
            }
            .frame(width: 67, height: 100)
            VStack(alignment: .leading, spacing: 0) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.year)
                    .font(.caption)
                Text(movie.genre)
                    .font(.caption2)
            }
            Spacer()
        }
    }
}

#Preview {
    MovieCellView(movie: .placeholder())
}
