//
//  HomeViewModel.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

import Foundation

protocol HomeViewDataSource {
    var movies: [Movie] { get set }
    var totalPages: Int { get set }
    var currentPage: Int { get set }

    func fetchMovies(completion:@escaping VoidClosure)
    func numberOfItemsInSection(section: Int) -> Int
    func cellForItemAt(indexPathRow: Int) -> MovieCellModel
}

protocol HomeViewEventSource {
    func didSelectItemAt(index: Int)
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    var currentPage: Int = 0
    var totalPages: Int = 0
    private var movieCellModels: [MovieCellModel] = []
    var movies: [Movie] = [] {
        didSet {
            setMovieCellModels()
        }
    }
    
    func fetchMovies(completion: @escaping VoidClosure) {
        let request = MovieDiscoverRequest(page: 1)
        dataProvider.request(for: request) { [weak self] result in
            switch result {
            case .success(let response):
                self?.movies = response.results ?? []
                self?.totalPages = response.totalPages ?? 0
                self?.currentPage = response.page ?? 0
            case .failure(let error):
                print(error)
            }
            completion()
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return movieCellModels.count
    }
    
    func cellForItemAt(indexPathRow: Int) -> MovieCellModel {
        return movieCellModels[indexPathRow]
    }
    
    func didSelectItemAt(index: Int) {
        guard let id = movieCellModels[index].movie.id else { return }
        router.pushMovieDetail(id: id)
    }
    
    private func setMovieCellModels() {
        movieCellModels = []
        for movie in movies {
            movieCellModels.append(MovieCellModel(movie: movie))
        }
    }
}
