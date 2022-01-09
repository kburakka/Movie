//
//  HomeViewController.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

import UIKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = MovieDiscoverRequest(page: 1)
        viewModel.dataProvider.request(for: request) { [weak self] result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
