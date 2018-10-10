//
//  NetworkingClientRequestEncodingType.swift
//  Pods
//
//  Created by Christian Ampe on 9/4/18.
//

import Foundation

// MARK: - Request Body Encoding Type Enumeration

/// supported request body encodings
enum NetworkingClientRequestEncodingType {
    
    /// json encoded request body]
    /// header key - content-type
    /// header value - application/json
    case jsonEncoded
}

// MARK: - Computed Variables
extension NetworkingClientRequestEncodingType {
    
    /// value of the content-type header
    var contentTypeValue: String {
        switch self {
        case .jsonEncoded:
            return "application/json"
        }
    }
}

// MARK: - Static Storage
extension NetworkingClientRequestEncodingType {
    
    /// key for content-type header
    static let contentTypeKey = "Content-Type"
}
