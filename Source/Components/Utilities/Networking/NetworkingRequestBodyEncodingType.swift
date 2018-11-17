//
//  NetworkingRequestBodyEncodingType.swift
//  Client
//
//  Created by Christian Ampe on 9/4/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Request Body Encoding Type Enumeration

/// supported request body encodings
enum NetworkingRequestBodyEncodingType {
    
    /// json encoded request body]
    /// header key - content-type
    /// header value - application/json
    case jsonEncoded
}

// MARK: - Computed Variables
extension NetworkingRequestBodyEncodingType {
    
    /// value of the content-type header
    var contentTypeValue: String {
        switch self {
        case .jsonEncoded:
            return "application/json"
        }
    }
}

// MARK: - Static Storage
extension NetworkingRequestBodyEncodingType {
    
    /// key for content-type header
    static let contentTypeKey = "Content-Type"
}
