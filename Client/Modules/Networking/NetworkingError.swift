//
//  NetworkingError.swift
//  Pods
//
//  Created by Christian Ampe on 9/5/18.
//

import Foundation

// MARK: - Networking Error Declaration
extension Networking {
    enum Error: Swift.Error {
        
        /// thrown when a network failure occurs
        case failure
        
        /// thrown when a network request returns a bad response
        case badResponse(httpStatusCode: Int)
    }
}
