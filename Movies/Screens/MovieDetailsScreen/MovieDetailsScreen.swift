import SwiftUI
import NukeUI

@MainActor
struct MovieDetailsScreen: View {

    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack {
                LazyImage(url: URL(string: movie.thumbURL)) { state in
                    if let image = state.image {
                        image
                            .resizable()
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
                .scaledToFit()
                Text(movie.title)
                    .font(.title)
                Text(movie.year)
                    .font(.caption)
                Text(movie.genre)
                    .font(.caption)
                Text(movie.description)
                    .font(.headline)
                    .padding()
            }
        }
        
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.white, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        MovieDetailsScreen(movie: .placeholder())
    }
}

