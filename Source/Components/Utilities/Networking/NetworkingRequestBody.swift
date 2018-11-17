//
//  NetworkingRequestBody.swift
//  Client
//
//  Created by Christian Ampe on 9/4/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Request Body Object Declaration

/// the object responsible for holding the http request body
struct NetworkingRequestBody {
    
    /// type of data encoding applied to the data object
    let encoding: NetworkingRequestBodyEncodingType
    
    /// encoded data to be passed in the http body
    let data: Data
    
    /// explicit initializer
    ///
    /// - Parameters:
    ///   - encoding: type of data encoding applied to the data object
    ///   - data: information being passed in the http body
    init(encoding: NetworkingRequestBodyEncodingType,
         data: Data) {
        
        self.encoding = encoding
        self.data = data
    }
}

// MARK: - Helper Initializers
extension NetworkingRequestBody {
    
    /// extractable optional initializer
    ///
    /// - Parameter extractable: object to be passed in the request body
    init?<E: NetworkingExtractable>(_ extractable: E) {
        switch E.encode(extractable) {
        case .success(let data):
            self.init(encoding: .jsonEncoded,
                      data: data)
        case .failure:
            return nil
        }
    }
}

