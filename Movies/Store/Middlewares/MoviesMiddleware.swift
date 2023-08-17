//
//  MoviesMiddleware.swift
//  Movies
//
//  Created by subhajit paul on 25/4/2023.
//

import Foundation

func moviesMiddeleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case let action as FetchMovies:
            Webservice().getMovies(search: action.search.urlEncode()) { result in
                switch result{
                case .success(let movies):
                    if let movies = movies {
                        dispatch(SetMovies(movies: movies))
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case let action as FetchMovieDetails:
            Webservice().getMoviesBy(imdbId: action.imdb) { result in
                switch result{
                case .success(let movieDetail):
                    if let movieDetail = movieDetail {
                        dispatch(SetMovieDetails(details: movieDetail))
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            break
        }
    }
}
