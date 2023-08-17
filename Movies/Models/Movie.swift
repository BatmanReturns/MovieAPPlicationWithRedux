//
//  Movie.swift
//  Movies
//
//  Created by subhajit paul on 24/4/2023.
//

import Foundation
struct MovieRespose: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}
struct Movie: Decodable {
    let title: String
    let poster: String
    let imdbId: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case poster = "Poster"
        case imdbId = "imdbID"
    }
    
}
