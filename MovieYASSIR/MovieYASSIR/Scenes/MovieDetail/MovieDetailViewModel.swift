//
//  MovieDetailViewModel.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

import Foundation

protocol MovieDetailViewDataSource {
    var movieId: Int? { get set }
    
    func fetchMovieDetail(completion: @escaping MovieClosure)
}

protocol MovieDetailViewEventSource {}

protocol MovieDetailViewProtocol: MovieDetailViewDataSource, MovieDetailViewEventSource {}


final class MovieDetailViewModel: BaseViewModel<MovieDetailRouter>, MovieDetailViewProtocol {
    var movieId: Int?
    
    func fetchMovieDetail(completion: @escaping MovieClosure) {
        guard let movieId = movieId else {
            return
        }

        let request = MovieDetailRequest(id: movieId)
        dataProvider.request(for: request) { result in
            switch result {
            case .success(let response):
                completion(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
