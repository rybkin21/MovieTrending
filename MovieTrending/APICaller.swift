//
//  APICaller.swift
//  MovieTrending
//
//  Created by Ivan Rybkin on 12.10.2024.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {

    static func getTrendingMovies(
        completionHandler: @escaping (_ result: Result<TrendingMovieModel, NetworkError>) -> Void) {

            let urlString = NetworkConstant.shared.serverAdress +
            "trending/all/day?api_key=" +
            NetworkConstant.shared.apiKey

            guard let url = URL(string: urlString) else {
                completionHandler(.failure(.urlError))
                return
            }

            URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
                if error == nil,
                   let data = dataResponse,
                   let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                    completionHandler(.success(resultData))
                } else {
                    completionHandler(.failure(.canNotParseData))
                }
            }.resume()
    }
}
