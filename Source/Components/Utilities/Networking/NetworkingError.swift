//
//  NetworkingError.swift
//  Client
//
//  Created by Ampe on 11/16/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    
    /// returned when no response is returned from a data task
    case unresponsive
    
    /// returned when the data task returns an error
    case underlying(Error)
    
    /// returned when the service gets an unexpected response
    case responseMapping(NetworkingResponse)
    
    /// returned when client declared validation fails
    case statusCode(NetworkingResponse)
}
