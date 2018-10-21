//
//  NetworkingClientError.swift
//  Client
//
//  Created by Christian Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// enum for a response error
enum NetworkingClientError: Error {
    case badRequest(message: String)
}
