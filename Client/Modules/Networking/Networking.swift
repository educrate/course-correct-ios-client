//
//  Networking.swift
//  Client
//
//  Created by Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Global Namespaced Networking Class
class Networking {
    
    // MARK: Public Init
    
    /// entry point for networking layer configuration
    /// - Parameters:
    ///     - configuration: model holding all endpoints and pathways
    init(_ configuration: Configuration) {
        Networking.Service.configuration = configuration
    }
    
    // MARK: Private Properties
    
    /// inialized provider holding reference to the innerworkings
    /// of the service layer
    private let provider = NetworkingClient()
    private let cache = NetworkingCache()
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
    func request<E: NetworkingExtractable>(_ target: Networking.Service,
                                          completion: @escaping (Result<E, Networking.Service.Error>) -> Swift.Void) {
        
        provider.request(target) { result in
            switch result {
            case .success(let result):
                let statusCode = result.statusCode
                
                guard result.isValid else {
                    completion(Result(error: .network(.badResponse(httpStatusCode: statusCode))))
                    return
                }
                
                let response = E.decode(result.data)
                self.cache.updateCache(for: target, with: response)
                completion(response)
                
            case .failure:
                completion(Result(error: .network(.failure)))
            }
        }
    }
}
