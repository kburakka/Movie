//
//  HomeViewModel.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

import Foundation

protocol HomeViewDataSource {}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    
}
