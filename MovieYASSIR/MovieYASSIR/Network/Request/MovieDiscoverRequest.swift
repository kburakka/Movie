//
//  MovieDiscoverRequest.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

import Foundation

struct MovieDiscoverRequest: APIDecodableResponseRequest {
    typealias ResponseType = MovieResult
    var path: String = "discover/movie?"
    var method: RequestMethod = .get
    
    init(page: Int) {
        self.path = "discover/movie?page=\(page)"
    }
}
