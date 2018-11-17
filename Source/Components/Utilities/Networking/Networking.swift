//
//  Networking.swift
//  Client
//
//  Created by Christian Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Global Namespaced Networking Class
class Networking {

    /// inialized provider holding reference to the innerworkings
    /// of the service layer
    private let service = NetworkingService()
}

// MARK: - Cached Properties
extension Networking {
    
    /// default json decoder to be utilized
    /// for all internally-conformed codables
    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    /// default json encoder to be utilized
    /// for all internally-conformed codables
    static let jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        return encoder
    }()
}

// MARK: - Internal API
extension Networking {
    
    /// request method used for requesting
    /// any service supported network calls
    /// - Parameters:
    ///     - target: enum holding possible network requests
    ///     - completion: result returning either a parsed model or an error
    func request<E: NetworkingExtractable>(_ target: NetworkingRequest,
                                          completion: @escaping (Result<E, NetworkingError>) -> Void) {
        
        service.request(target) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                
                guard target.validation.range.contains(statusCode) else {
                    completion(Result(error: .statusCode(response)))
                    return
                }
                
                let decodingResult = E.decode(response.data)
                
                switch decodingResult {
                case .success(let object):
                    completion(Result(value: object))
                case .failure:
                    completion(Result(error: .responseMapping(response)))
                }
                
            case .failure(let error):
                completion(Result(error: error))
            }
        }
    }
}
