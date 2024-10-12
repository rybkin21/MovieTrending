//
//  NetworkConstant.swift
//  MovieTrending
//
//  Created by Ivan Rybkin on 12.10.2024.
//

import Foundation

class NetworkConstant {

    public static var shared: NetworkConstant = NetworkConstant()

    private init() {
        //Singltone
    }

    public var apiKey: String {
        get {
            //API key from //https:/themoviedb.org/
            return "c66afa384cb41ae8027aeede1b6974c2"
        }
    }

    public var serverAdress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }

    public var imageServerAdress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
