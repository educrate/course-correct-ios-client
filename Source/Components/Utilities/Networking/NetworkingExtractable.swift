//
//  Extractable.swift
//  Client
//
//  Created by Christian Ampe on 8/29/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Extractable Declaration

/// extractable objects know how to turn input data into itself
/// if this parsing fails it will throw a result error of type `.parsing`
protocol NetworkingExtractable {
    
    /// method used for transforming a network object from data
    ///
    /// - Parameter data: data to be parsed out into its cooresponding model
    /// - Returns: result containing either a formed object or an error
    static func decode(_ data: Data) -> Result<Self, NetworkingError>
    
    /// method used for transforming a network object into data
    ///
    /// - Parameter extractable: object which can be extracted
    /// - Returns: result containing either data from the passed in object or an error
    static func encode(_ extractable: Self) -> Result<Data, NetworkingError>
}

// MARK: - Extractable Conformance Of Type Codable
extension NetworkingExtractable where Self: Codable {
    
    /// default decode implementation for codables
    ///
    /// - Parameter data: data to be parsed out into its cooresponding model
    /// - Returns: result containing either a formed object or an error
    static func decode(_ data: Data) -> Result<Self, NetworkingExtractableError> {
        do {
            let result: Self = try Networking.jsonDecoder.decode(Self.self, from: data)
            return Result(value: result)
        } catch {
            return Result(error: .parsing)
        }
    }
    
    /// default encode implementation for codables
    ///
    /// - Parameter extractable: object which can be extracted
    /// - Returns: result containing either data from the passed in object or an error
    static func encode(_ extractable: Self) -> Result<Data, NetworkingExtractableError> {
        do {
            let result: Data = try Networking.jsonEncoder.encode(extractable)
            return Result(value: result)
        } catch {
            return Result(error: .parsing)
        }
    }
}
