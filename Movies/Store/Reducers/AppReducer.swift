//
//  AppReducer.swift
//  CombiningReducers
//
//  Created by Subhajit Paul on 24/4/2023.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    
    var state = state
    state.movies = moviesReducer(state.movies, action)
    return state
}
