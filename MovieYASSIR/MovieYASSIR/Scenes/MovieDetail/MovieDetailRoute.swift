//
//  MovieDetailRoute.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

protocol MovieDetailRoute {
    func pushMovieDetail(id: Int)
}

extension MovieDetailRoute where Self: RouterProtocol {
    
    func pushMovieDetail(id: Int) {
        let router = MovieDetailRouter()
        let viewModel = MovieDetailViewModel(router: router)
        viewModel.movieId = id
        let viewController = MovieDetailViewController(viewModel: viewModel)
        viewController.title = "Movie Detail"
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
