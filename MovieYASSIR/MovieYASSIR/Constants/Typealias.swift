//
//  Typealias.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

typealias RequestParameters = [String: Any]
typealias RequestHeaders = [String: String]
typealias DataProviderResult<T: Decodable> = ((Result<T, Error>) -> Void)
