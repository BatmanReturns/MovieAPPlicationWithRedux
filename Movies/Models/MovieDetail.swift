//
//  MovieDetail.swift
//  Movies
//
//  Created by subhajit paul on 30/4/2023.
//

import Foundation

struct MovieDetail: Decodable {
    let title: String
    let plot: String
    let imdbRating: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case plot = "Plot"
        case imdbRating = "imdbRating"
        case poster = "Poster"
    }
}
