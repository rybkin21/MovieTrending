//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by Ivan Rybkin on 12.10.2024.
//

import Foundation

class MainViewModel {

    func numberOfSections() -> Int {
        1
    }

    func numberOfRows(in section: Int) -> Int {
        10
    }

    func getData() {
        APICaller.getTrendingMovies { result in
            switch result {
            case .success(let data):
                print("Top Trending Counts: \(data.results.count)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
