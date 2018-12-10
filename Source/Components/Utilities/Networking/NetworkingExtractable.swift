//
//  Extractable.swift
//  Client
//
//  Created by Christian Ampe on 8/29/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Extractable Declaration

/// An extractable objects know how to turn input data into itself.
/// If this parsing fails it will throw a result error of type `.parsing`.
protocol NetworkingExtractable {
    
    /// The method used for transforming a network object from data.
    ///
    /// - Parameter data: The data to be parsed out into its cooresponding model.
    /// - Returns: A result containing either a formed object or an error.
    static func decode(_ data: Data) -> Result<Self, NetworkingExtractableError>
    
    /// The method used for transforming a network object into data.
    ///
    /// - Parameter extractable: The object to be transformed into data.
    /// - Returns: A result containing either data from the passed in object or an error.
    static func encode(_ extractable: Self) -> Result<Data, NetworkingExtractableError>
}

// MARK: - Extractable Conformance Of Type Codable
extension NetworkingExtractable where Self: Codable {
    
    /// The default decode implementation for codables.
    ///
    /// - Parameter data: The data to be parsed out into its cooresponding model.
    /// - Returns: A result containing either a formed object or an error.
    static func decode(_ data: Data) -> Result<Self, NetworkingExtractableError> {
        do {
            let result: Self = try NetworkingHelper.jsonDecoder.decode(Self.self, from: data)
            return Result(value: result)
        } catch {
            return Result(error: .parsing)
        }
    }
    
    /// The default encode implementation for codables.
    ///
    /// - Parameter extractable: The object to be transformed into data.
    /// - Returns: A result containing either data from the passed in object or an error.
    static func encode(_ extractable: Self) -> Result<Data, NetworkingExtractableError> {
        do {
            let result: Data = try NetworkingHelper.jsonEncoder.encode(extractable)
            return Result(value: result)
        } catch {
            return Result(error: .parsing)
        }
    }
}
