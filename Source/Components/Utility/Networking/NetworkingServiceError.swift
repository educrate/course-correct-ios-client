//
//  NetworkingServiceError.swift
//  Client
//
//  Created by Christian Ampe on 9/5/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

extension Networking.Service {
    enum Error: Swift.Error {
        
        /// thrown when a model fails to parse
        case parsing
        
        /// thrown when an inconsistency is unavoidable
        case inconsistency(message: String)
        
        /// thrown when a generic error is passed
        case other(error: Swift.Error)
    }
}
