//
//  Result.swift
//  Client
//
//  Created by Christian Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

/// An enum representing either a failure with an explanatory error, or a success with a result value.
enum Result<Value, Error: Swift.Error>: ResultProtocol, CustomStringConvertible, CustomDebugStringConvertible {
	case success(Value)
	case failure(Error)

	// MARK: Constructors

	/// Constructs a success wrapping a `value`.
	init(value: Value) {
		self = .success(value)
	}

	/// Constructs a failure wrapping an `error`.
	init(error: Error) {
		self = .failure(error)
	}

	/// Constructs a result from an `Optional`, failing with `Error` if `nil`.
	init(_ value: Value?, failWith: @autoclosure () -> Error) {
		self = value.map(Result.success) ?? .failure(failWith())
	}

	/// Constructs a result from a function that uses `throw`, failing with `Error` if throws.
	init(_ f: @autoclosure () throws -> Value) {
		self.init(attempt: f)
	}

	/// Constructs a result from a function that uses `throw`, failing with `Error` if throws.
	init(attempt f: () throws -> Value) {
		do {
			self = .success(try f())
		} catch var error {
			if Error.self == ResultAnyError.self {
				error = ResultAnyError(error)
			}
			self = .failure(error as! Error)
		}
	}

	// MARK: Deconstruction

	/// Returns the value from `success` Results or `throw`s the error.
	func dematerialize() throws -> Value {
		switch self {
		case let .success(value):
			return value
		case let .failure(error):
			throw error
		}
	}

	/// Case analysis for Result.
	///
	/// Returns the value produced by applying `ifFailure` to `failure` Results, or `ifSuccess` to `success` Results.
	func analysis<Result>(ifSuccess: (Value) -> Result, ifFailure: (Error) -> Result) -> Result {
		switch self {
		case let .success(value):
			return ifSuccess(value)
		case let .failure(value):
			return ifFailure(value)
		}
	}

	// MARK: Errors

	/// The domain for errors constructed by Result.
	static var errorDomain: String { return "com.antitypical.Result" }

	/// The userInfo key for source functions in errors constructed by Result.
	static var functionKey: String { return "\(errorDomain).function" }

	/// The userInfo key for source file paths in errors constructed by Result.
	static var fileKey: String { return "\(errorDomain).file" }

	/// The userInfo key for source file line numbers in errors constructed by Result.
	static var lineKey: String { return "\(errorDomain).line" }

	/// Constructs an error.
	static func error(_ message: String? = nil, function: String = #function, file: String = #file, line: Int = #line) -> NSError {
		var userInfo: [String: Any] = [
			functionKey: function,
			fileKey: file,
			lineKey: line,
		]

		if let message = message {
			userInfo[NSLocalizedDescriptionKey] = message
		}

		return NSError(domain: errorDomain, code: 0, userInfo: userInfo)
	}


	// MARK: CustomStringConvertible

	var description: String {
		switch self {
		case let .success(value): return ".success(\(value))"
		case let .failure(error): return ".failure(\(error))"
		}
	}


	// MARK: CustomDebugStringConvertible

	var debugDescription: String {
		return description
	}

	// MARK: ResultProtocol
	var result: Result<Value, Error> {
		return self
	}
}

extension Result where Error == ResultAnyError {
	/// Constructs a result from an expression that uses `throw`, failing with `AnyError` if throws.
	init(_ f: @autoclosure () throws -> Value) {
		self.init(attempt: f)
	}

	/// Constructs a result from a closure that uses `throw`, failing with `AnyError` if throws.
	init(attempt f: () throws -> Value) {
		do {
			self = .success(try f())
		} catch {
			self = .failure(ResultAnyError(error))
		}
	}
}

// MARK: - Derive result from failable closure

@available(*, deprecated, renamed: "Result.init(attempt:)")
func materialize<T>(_ f: () throws -> T) -> Result<T, ResultAnyError> {
	return Result(attempt: f)
}

@available(*, deprecated, renamed: "Result.init(_:)")
func materialize<T>(_ f: @autoclosure () throws -> T) -> Result<T, ResultAnyError> {
	return Result(f)
}

// MARK: - ErrorConvertible conformance
	
extension NSError: ErrorConvertible {
	static func error(from error: Swift.Error) -> Self {
		func cast<T: NSError>(_ error: Swift.Error) -> T {
			return error as! T
		}

		return cast(error)
	}
}

// MARK: - migration support

@available(*, unavailable, message: "Use the overload which returns `Result<T, AnyError>` instead")
func materialize<T>(_ f: () throws -> T) -> Result<T, NSError> {
	fatalError()
}

@available(*, unavailable, message: "Use the overload which returns `Result<T, AnyError>` instead")
func materialize<T>(_ f: @autoclosure () throws -> T) -> Result<T, NSError> {
	fatalError()
}

#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)

/// Constructs a `Result` with the result of calling `try` with an error pointer.
//  Copyright © 2018 Educrate. All rights reserved.
///
/// This is convenient for wrapping Cocoa API which returns an object or `nil` + an error, by reference. e.g.:
///
///     Result.try { NSData(contentsOfURL: URL, options: .dataReadingMapped, error: $0) }
@available(*, unavailable, message: "This has been removed. Use `Result.init(attempt:)` instead. See https://github.com/antitypical/Result/issues/85 for the details.")
func `try`<T>(_ function: String = #function, file: String = #file, line: Int = #line, `try`: (NSErrorPointer) -> T?) -> Result<T, NSError> {
	fatalError()
}

/// Constructs a `Result` with the result of calling `try` with an error pointer.
//  Copyright © 2018 Educrate. All rights reserved.
///
/// This is convenient for wrapping Cocoa API which returns a `Bool` + an error, by reference. e.g.:
///
///     Result.try { NSFileManager.defaultManager().removeItemAtURL(URL, error: $0) }
@available(*, unavailable, message: "This has been removed. Use `Result.init(attempt:)` instead. See https://github.com/antitypical/Result/issues/85 for the details.")
func `try`(_ function: String = #function, file: String = #file, line: Int = #line, `try`: (NSErrorPointer) -> Bool) -> Result<(), NSError> {
	fatalError()
}

#endif

// MARK: -

import Foundation
