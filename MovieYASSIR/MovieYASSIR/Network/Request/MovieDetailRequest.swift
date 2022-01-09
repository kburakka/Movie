//
//  MovieDetailRequest.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

import Foundation

struct MovieDetailRequest: APIDecodableResponseRequest {
    typealias ResponseType = Movie
    var path: String = "movie/"
    var method: RequestMethod = .get
    
    init(id: Int) {
        self.path = "movie/\(id)?"
    }
}
