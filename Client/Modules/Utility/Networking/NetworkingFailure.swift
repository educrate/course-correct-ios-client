//
//  NetworkingFailure.swift
//  Client
//
//  Created by Christian Ampe on 8/29/18.
//  Copyright © 2018 Educrate. All rights reserved.
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
