//
//  MovieResult.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

import Foundation

struct MovieResult: Codable {
    let page: Int?
    let results: [Movie]?
    let totalResults, totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
