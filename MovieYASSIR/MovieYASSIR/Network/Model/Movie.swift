//
//  Movie.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

struct Movie: Codable {
    let releaseDate, originalTitle, posterPath: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case releaseDate = "release_date"
        case id
        case originalTitle = "original_title"
        case posterPath = "poster_path"
    }
}
