//
//  NetworkingService.swift
//  Client
//
//  Created by Christian Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class NetworkingService {
    
    /// url session used to make all network requests
    private let session = URLSession(configuration: .default)
}


extension NetworkingService {
    
    /// core method for making a network request
    ///
    /// - Parameters:
    ///   - request: a request object containing all information necessary for making a network request
    ///   - completion: returns a generic result containing either an error or successful response
    func request(_ request: NetworkingRequest,
                 completion: @escaping (Result<NetworkingResponse, NetworkingError>) -> Void) {
        
        session.dataTask(with: request.urlRequest) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                completion(Result(error: .unresponsive))
                return
            }
            
            if let error = error {
                completion(Result(error: .underlying(error)))
            } else if let data = data {
                completion(Result(value: NetworkingResponse(statusCode: response.statusCode,
                                                            data: data,
                                                            request: request.urlRequest,
                                                            response: response)))
            }
            
            }.resume()
    }
}
