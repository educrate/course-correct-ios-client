//
//  NetworkingResult.swift
//  Pods
//
//  Created by Christian Ampe on 8/29/18.
//

import Foundation

// MARK: - Network Result Enum Declaration
extension Networking {
    enum Result<Object, ServiceError: Swift.Error> {
        
        /// successful response with associated generic value
        case success(Object)
        
        /// failure response with associated networking error
        case failure(Networking.Failure<ServiceError>)
    }
}

// MARK: - Initalizers
extension Networking.Result {
    init(value: Object) {
        self = .success(value)
    }
    
    init(error: Networking.Failure<ServiceError>) {
        self = .failure(error)
    }
}

// MARK: - Intalizers When Result Is Of Type Void
extension Networking.Result where Object == Void {
    init() {
        self = .success(())
    }
    
    static var success: Networking.Result<Object, ServiceError> {
        return .success(())
    }
}
