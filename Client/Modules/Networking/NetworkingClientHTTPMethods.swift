//
//  NetworkingClientHTTPMethods.swift
//  Client
//
//  Created by Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

enum NetworkingClientHTTPMethod: String {
    case get
    case head
    case post
    case put
    case delete
    case connect
    case options
    case trace
}

extension NetworkingClientHTTPMethod {
    var name: String {
        return rawValue.uppercased()
    }
}
