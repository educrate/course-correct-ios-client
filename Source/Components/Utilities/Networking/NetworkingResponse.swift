//
//  NetworkingResponse.swift
//  Client
//
//  Created by Christian Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct NetworkingResponse {
    
    /// data returned from the network request
    let data: Data
    
    /// url request sent to server
    let request: URLRequest
    
    /// http url response returned from server
    let response: HTTPURLResponse
    
    /// explicit initializer
    ///
    /// - Parameters:
    ///   - data: data returned from the network request
    ///   - request: url request sent to server
    ///   - response: http url response returned from server
    init(data: Data,
         request: URLRequest,
         response: HTTPURLResponse) {
        
        self.data = data
        self.request = request
        self.response = response
    }
}
