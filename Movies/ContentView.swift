//
//  ContentView.swift
//  Movies
//
//  Created by subhajit paul on 24/4/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store<AppState>
    @State var search: String = ""
    
    struct Props {
        let movies: [Movie]
        let onSearch: (String) -> Void
    }
    //This function is used for mapping of MovieState to local Props
    private func map(state: MovieState) -> Props {
        Props(movies: state.movies, onSearch: { keyword in
            store.dispatch(action: FetchMovies(search: keyword))
        })
    }
    var body: some View {
        let props = map(state: store.state.movies)
        VStack {
            TextField("Search a movie", text: $search, onEditingChanged: { _ in }, onCommit: {
                props.onSearch(search)
            }).padding()
            List(props.movies, id: \.imdbId){ movie in
                NavigationLink {
                    MovieDetailsView(movie: movie)
                } label: {
                    MovieCell(movie: movie)
                }

                MovieCell(movie:movie)
            }.listStyle(PlainListStyle())
        }.navigationTitle("Movies")
        .embedInNavigationView()
    }
}

struct MovieCell: View {
    let movie:Movie
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: 100, height: 125)
                .cornerRadius(10)
            Text(movie.title)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddeleware()])
        ContentView().environmentObject(store)
    }
}
