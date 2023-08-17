//
//  Constants.swift
//  MoviesApp
//
//  Created by Subhajit Paul on 24/4/2023.
//

import Foundation

struct Constants {
    
    struct ApiKeys {
        static let omdbIdKey = "9fb73d8a"
    }
    
    struct Urls {
        static func urlBySearch(search: String) -> String {
            "https://www.omdbapi.com/?s=\(search)&page=1&apikey=\(ApiKeys.omdbIdKey)"
        }
        
        static func urlForMovieDetailsByImdbId(imdbId: String) -> String {
            "https://www.omdbapi.com/?i=\(imdbId)&apikey=\(ApiKeys.omdbIdKey)"
        }
    }
}
