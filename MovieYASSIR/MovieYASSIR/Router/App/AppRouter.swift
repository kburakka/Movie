//
//  AppRouter.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

import UIKit

final class AppRouter: Router, AppRouter.Routes {
    // This typealias includes the routes which AppRouter can open
    typealias Routes = HomeRoute
    
    static let shared = AppRouter()
    
    func startApp() {
        pushHome()
    }
}
