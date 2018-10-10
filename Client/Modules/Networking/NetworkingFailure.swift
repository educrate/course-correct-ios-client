//
//  NetworkingFailure.swift
//  Pods
//
//  Created by Christian Ampe on 8/29/18.
//

import Foundation

// MARK: - Networking Failure Declaration
extension Networking {
    enum Failure<ServiceError: Swift.Error>: Swift.Error {
        
        /// thrown when there is an error with the network
        case network(Error)
        
        /// thrown when there is an error with an service
        case service(ServiceError)
    }
}
