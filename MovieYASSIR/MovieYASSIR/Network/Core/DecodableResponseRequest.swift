//
//  DecodableResponseRequest.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
