//
//  ResultNoError.swift
//  Client
//
//  Created by Christian Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

/// An “error” that is impossible to construct.
/// This can be used to describe `Result`s where failures will never
/// be generated. For example, `Result<Int, NoError>` describes a result that
/// contains an `Integer` and is guaranteed never to be a `failure`.
enum ResultNoError: Swift.Error, Equatable {
    static func ==(lhs: ResultNoError, rhs: ResultNoError) -> Bool {
		return true
	}
}
