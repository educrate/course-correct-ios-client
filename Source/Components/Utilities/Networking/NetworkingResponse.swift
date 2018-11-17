//
//  NetworkingResponse.swift
//  Client
//
//  Created by Christian Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct NetworkingResponse {
    let statusCode: Int
    let data: Data
    let request: URLRequest
    let response: HTTPURLResponse
    
    init(statusCode: Int,
        data: Data,
        request: URLRequest,
        response: HTTPURLResponse) {
        
        self.statusCode = statusCode
        self.data = data
        self.request = request
        self.response = response
    }
}
