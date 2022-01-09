//
//  RequestProtocol.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

protocol RequestProtocol {
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters { get }
    var headers: RequestHeaders { get }
    var encoding: RequestEncoding { get }
    var url: String { get }
}
