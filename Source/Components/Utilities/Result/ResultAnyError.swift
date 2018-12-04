//
//  ResultAnyError.swift
//  Client
//
//  Created by Christian Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

/// A type-erased error which wraps an arbitrary error instance.
/// This should be useful for generic contexts.
struct ResultAnyError: Swift.Error {
	
    /// The underlying error.
	let error: Swift.Error

	init(_ error: Swift.Error) {
		if let anyError = error as? ResultAnyError {
			self = anyError
		} else {
			self.error = error
		}
	}
}

extension ResultAnyError: ErrorConvertible {
	static func error(from error: Error) -> ResultAnyError {
		return ResultAnyError(error)
	}
}

extension ResultAnyError: CustomStringConvertible {
	var description: String {
		return String(describing: error)
	}
}

extension ResultAnyError: LocalizedError {
	var errorDescription: String? {
		return error.localizedDescription
	}

	var failureReason: String? {
		return (error as? LocalizedError)?.failureReason
	}

	var helpAnchor: String? {
		return (error as? LocalizedError)?.helpAnchor
	}

	var recoverySuggestion: String? {
		return (error as? LocalizedError)?.recoverySuggestion
	}
}
