//
//  NetworkingClient.swift
//  Client
//
//  Created by Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class NetworkingClient {
    
    /// url session used to make all network requests
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }()
}

extension NetworkingClient {
    
    
    /// core method for making a network request
    ///
    /// - Parameters:
    ///   - request: a request object containing all information necessary for making a network request
    ///   - completion: returns a generic result containing either an error or successful response
    func request<R: NetworkingClientRequest>(_ request: R,
                                             completion: @escaping (NetworkingClientResult<NetworkingClientResponse, NetworkingClientError>) -> Void) {
        
        session.dataTask(with: request.urlRequest) { data, response, error in
            guard let response = response else {
                guard let error = error else {
                    completion(NetworkingClientResult(error: .badRequest(message: "inconsistency")))
                    return
                }
                
                completion(NetworkingClientResult(error: .badRequest(message: error.localizedDescription)))
                return
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {
                completion(NetworkingClientResult(error: .badRequest(message: "bad http url request")))
                return
            }
            
            guard let data = data else {
                completion(NetworkingClientResult(error: .badRequest(message: "data not returned from request")))
                return
            }
            
            completion(NetworkingClientResult(value: request.response(from: data, urlResponse: urlResponse)))
            
            }.resume()
    }
}
