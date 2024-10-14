//
//  MovieTableCellViewModel.swift
//  MovieTrending
//
//  Created by Ivan Rybkin on 14.10.2024.
//

import Foundation

class MovieTableCellViewModel {

    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?

    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.rating = "\(movie.voteAverage)/10"
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.imageUrl = makeImageURL(movie.posterPath ?? "")
    }

    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAdress)\(imageCode)")
    }
}
