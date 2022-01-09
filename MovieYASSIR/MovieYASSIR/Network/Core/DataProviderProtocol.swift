//
//  DataProviderProtocol.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

import Alamofire

protocol DataProviderProtocol {
    func request<T: DecodableResponseRequest>(for request: T,
                                              result: DataProviderResult<T.ResponseType>?)
}
