//
//  MoviesReducer.swift
//  Movies
//
//  Created by subhajit paul on 25/4/2023.
//

import Foundation

func moviesReducer(_ state:MovieState,_ action: Action) -> MovieState {
    var state = state
    switch action {
    case let action as SetMovies:
        state.movies = action.movies
    case let action as SetMovieDetails:
        state.selectedMovieDetail = action.details
    default:
        break
    }
    return state
    
}
