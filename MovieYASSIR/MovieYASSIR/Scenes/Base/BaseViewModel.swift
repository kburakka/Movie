//
//  BaseViewModel.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

import UIKit

protocol BaseViewModelDataSource: AnyObject { }

protocol BaseViewModelEventSource: AnyObject { }

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    func showAlert(title: String, message: String)
    func showLoadingView()
    func hideLoadingView()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {

    var router: R
    var dataProvider: DataProviderProtocol

    init(router: R, dataProvider: DataProviderProtocol = ApiProvider.shared) {
        self.router = router
        self.dataProvider = dataProvider
    }
    
    func showLoadingView() { }
    
    func hideLoadingView() {    }
    
    func showAlert(title: String, message: String) {    }
    
}
