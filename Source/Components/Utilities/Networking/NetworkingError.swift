//
//  NetworkingError.swift
//  Client
//
//  Created by Ampe on 11/16/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case unresponsive
    case underlying(Error)
    case responseMapping(NetworkingResponse)
    case requestMapping
    case statusCode(NetworkingResponse)
}
