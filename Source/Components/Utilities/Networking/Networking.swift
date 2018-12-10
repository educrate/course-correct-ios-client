//
//  Networking.swift
//  Client
//
//  Created by Christian Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Networking Class
class Networking<T: NetworkingRequest> {
    
    /// Initialized provider holding reference
    /// to the innerworkings of the service layer.
    private let service = NetworkingService<T>()
}

// MARK: - Internal API
extension Networking {
    
    /// Request method used for requesting
    /// any service supported network calls.
    /// - Parameters:
    ///     - target: Enum holding possible network requests.
    ///     - extractable: The model to parsed and returned in the result.
    ///     - completion: Result returning either a parsed model or an error.
    func request<E: NetworkingExtractable>(_ target: T,
                                           extractable: E.Type,
                                           completion: @escaping (Result<E, NetworkingError>) -> Void) {
        
        // make request to specified target
        service.request(target) { result in
            
            // switch on result of network request
            switch result {
                
            case .success(let response):
                
                // validate response status code from specified request
                guard target.validation.range.contains(response.response.statusCode) else {
                    
                    // invalid status code according to client
                    completion(Result(error: .statusCode(response)))
                    return
                }
                
                // switch on decode result of response data
                switch E.decode(response.data) {
                    
                case .success(let object):
                    
                    // successful result with parsed object
                    completion(Result(value: object))
                    
                case .failure:
                    
                    // unexpected data returned
                    completion(Result(error: .responseMapping(response)))
                }
                
            case .failure(let error):
                
                // something went wrong with the network request
                completion(Result(error: error))
            }
        }
    }
}
