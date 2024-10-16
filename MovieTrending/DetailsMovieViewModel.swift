//
//  DetailsViewModel.swift
//  MovieTrending
//
//  Created by Ivan Rybkin on 16.10.2024.
//

import Foundation

class DetailsMovieViewModel {

    var movie: Movie

    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieID: Int

    init(movie: Movie) {
        self.movie = movie

        self.movieID = movie.id
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDescription = movie.overview ?? ""
        self.movieImage = makeImageURL(movie.backdropPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAdress)\(imageCode)")
    }
}
