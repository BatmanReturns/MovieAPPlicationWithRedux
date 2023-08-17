//
//  MoviesApp.swift
//  Movies
//
//  Created by subhajit paul on 24/4/2023.
//

import SwiftUI

@main
struct MoviesApp: App {
    var body: some Scene {
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddeleware()])
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
