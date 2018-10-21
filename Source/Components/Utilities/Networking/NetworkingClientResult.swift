//
//  NetworkingClientResult.swift
//  Client
//
//  Created by Christian Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

enum NetworkingClientResult<Response, Error: Swift.Error> {
    case success(Response)
    case failure(Error)
}

extension NetworkingClientResult {
    init(value: Response) {
        self = .success(value)
    }
    
    init(error: Error) {
        self = .failure(error)
    }
}

// MARK: - Intalizers When Result Is Of Type Void
extension NetworkingClientResult where Response == Void {
    init() {
        self = .success(())
    }
    
    static var success: NetworkingClientResult<Response, Error> {
        return .success(())
    }
}

