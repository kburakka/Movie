//
//  APIDecodableResponseRequest.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

protocol APIDecodableResponseRequest: DecodableResponseRequest {}

// MARK: - RequestEncoding
extension APIDecodableResponseRequest {
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        }
    }
}

// MARK: - URL
extension APIDecodableResponseRequest {
    var url: String {
        print(Constants.baseUrl + path + Constants.apiKey)
        return Constants.baseUrl + path + Constants.apiKey
    }
}

// MARK: - RequestParameters
extension APIDecodableResponseRequest {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
extension APIDecodableResponseRequest {
    var headers: RequestHeaders {
        return [:]
    }
}
