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
    
    /// method which takes in data and decodes it into itself
    ///  - Parameters:
    ///     - data: data to be parsed out into its cooresponding model
    static func decode(_ data: Data) -> Networking.Result<Self, Networking.Service.Error>
    
    /// method which transforms itself into a data representation
    static func encode(_ extractable: Self) -> Networking.Result<Data, Networking.Service.Error>
}

// MARK: - Extractable Conformance Of Type Codable
extension NetworkingExtractable where Self: Codable {
    
    /// default extractable protocol implementation for
    /// codable models which uses the static json decoder
    /// found in the networking layer
    ///  - Parameters:
    ///     - data: data to be parsed out into its cooresponding model
    static func decode(_ data: Data) -> Networking.Result<Self, Networking.Service.Error> {
        do {
            let result: Self = try Networking.jsonDecoder.decode(Self.self, from: data)
            return Networking.Result(value: result)
        } catch {
            return Networking.Result(error: .service(.parsing))
        }
    }
    
    /// default extractable protocol implementation for
    /// codable models which uses the static json decoder
    /// found in the networking layer
    ///  - Parameters:
    ///     - extractable: object which can be extracted
    static func encode(_ extractable: Self) -> Networking.Result<Data, Networking.Service.Error> {
        do {
            let result: Data = try Networking.jsonEncoder.encode(extractable)
            return Networking.Result(value: result)
        } catch {
            return Networking.Result(error: .service(.parsing))
        }
    }
}
