//
//  Webservice.swift
//  Movies
//
//  Created by subhajit paul on 24/4/2023.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case decodingError
    case noData
}

class Webservice {
    func getMovies(search: String, completion: @escaping(Result<[Movie]?,NetworkError>) -> Void)  {
        guard let moviesURL = URL(string: Constants.Urls.urlBySearch(search: search)) else {
            completion(.failure(.badUrl))
            return
        }
        URLSession.shared.dataTask(with: moviesURL) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            let movieResponse = try? JSONDecoder().decode(MovieRespose.self, from: data)
            if let movieResponse = movieResponse {
                completion(.success(movieResponse.movies))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func getMoviesBy(imdbId: String,completion: @escaping(Result<MovieDetail?,NetworkError>) -> Void) {
        guard let moviesURL = URL(string: Constants.Urls.urlForMovieDetailsByImdbId(imdbId: imdbId)) else {
            completion(.failure(.badUrl))
            return
        }
        URLSession.shared.dataTask(with: moviesURL) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            let movieResponse = try? JSONDecoder().decode(MovieDetail.self, from: data)
            if let movieResponse = movieResponse {
                completion(.success(movieResponse))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
