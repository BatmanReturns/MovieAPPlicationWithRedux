//
//  MovieDetailsView.swift
//  Movies
//
//  Created by subhajit paul on 30/4/2023.
//

import SwiftUI

struct MovieDetailsView: View {
    var movie: Movie
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        let details: MovieDetail?
        let onLoadMovieDetails: (String)->Void
    }
    private func map(state: MovieState) ->  Props {
        Props(details: state.selectedMovieDetail) { imdbId in
            store.dispatch(action: FetchMovieDetails(imdb: imdbId))
        }
    }
    var body: some View {
        VStack{
            let props = map(state: store.state.movies)
            Group {
                if let details = props.details{
                    VStack(alignment: .leading){
                        HStack{
                            Spacer()
                            URLImage(url: details.poster)
                        }
                        Text(details.title).padding(5).font(.title)
                        Text(details.plot).padding(5)
                        HStack{
                            Text("Rating")
                            RatingView(rating: .constant(details.imdbRating.toInt()))
                        }.padding()
                        Spacer()
                    }
                }else{
                    Text("Loading...")
                }
            }
            .onAppear {
                props.onLoadMovieDetails(movie.imdbId)
            }
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddeleware()])
        MovieDetailsView(movie: Movie(title: "Batman", poster: "https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg", imdbId: "tt0372784")).environmentObject(store)
    }
}
