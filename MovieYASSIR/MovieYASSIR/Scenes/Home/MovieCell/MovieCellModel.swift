//
//  MovieCellModel.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

import Foundation

protocol MovieCellDataSource: AnyObject {
    var movie: Movie { get }
}

protocol MovieCellEventSource: AnyObject { }

protocol MovieCellProtocol: MovieCellDataSource, MovieCellEventSource { }

final class MovieCellModel: MovieCellProtocol {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
