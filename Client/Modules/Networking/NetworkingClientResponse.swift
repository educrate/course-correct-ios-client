//
//  NetworkingClientResponse.swift
//  Client
//
//  Created by Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class NetworkingClientResponse {
    let statusCode: Int
    let data: Data
    
    init(statusCode: Int, data: Data) {
        self.statusCode = statusCode
        self.data = data
    }
}

extension NetworkingClientResponse {
    var isValid: Bool {
        return statusCode >= 200 && statusCode <= 299 ? true : false
    }
}
