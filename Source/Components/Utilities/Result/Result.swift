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
    
    /// Generic success result returned with the associated `Value`.
	case success(Value)
    
    /// Generic failure result returned with the associated `Error`.
	case failure(Error)

	// MARK: - Constructors

	/// Constructs a success wrapping a `value`.
	init(value: Value) {
		self = .success(value)
	}
	
    /// Constructs a failure wrapping an `error`.
    ///
    /// - Parameter error: `Error` used to construct a `failure` case
	init(error: Error) {
		self = .failure(error)
	}

    /// Constructs a result from an `Optional`, failing with `Error` if `nil`.
    ///
    /// - Parameters:
    ///   - value: Optional value.
    ///   - failWith: Closure to be executed to return an error on the case where no value is provided.
	init(_ value: Value?, failWith: @autoclosure () -> Error) {
		self = value.map(Result.success) ?? .failure(failWith())
	}
    
    /// Constructs a result from a function that uses `throw`, failing with `Error` if throws.
    ///
    /// - Parameter block: Closure to be executed.
	init(_ block: @autoclosure () throws -> Value) {
		self.init(attempt: block)
	}
	
    /// Constructs a result from a function that uses `throw`, failing with `Error` if throws.
    ///
    /// - Parameter block: Closure to be attempted.
	init(attempt block: () throws -> Value) {
		do {
			self = .success(try block())
		} catch var error {
			if Error.self == ResultAnyError.self {
				error = ResultAnyError(error)
			}
			self = .failure(error as! Error)
		}
	}

	// MARK: - Deconstruction

    /// Deconstructs the result into its component.
    ///
    /// - Returns: Associated value from the `success` case.
    /// - Throws: Associated error from the `failure` case.
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
    /// - Parameters:
    ///   - ifSuccess: Closure to be executed if the result is a `success`.
    ///   - ifFailure: Closure to be executed if the result is a `failure`.
    /// - Returns: The value produced by applying `ifFailure` to `failure` Results, or `ifSuccess` to `success` Results.
	func analysis<Result>(ifSuccess: (Value) -> Result, ifFailure: (Error) -> Result) -> Result {
		switch self {
		case let .success(value):
			return ifSuccess(value)
		case let .failure(value):
			return ifFailure(value)
		}
	}

	// MARK: - Errors

	/// The domain for errors constructed by Result.
	static var errorDomain: String { return "com.antitypical.Result" }

	/// The userInfo key for source functions in errors constructed by Result.
	static var functionKey: String { return "\(errorDomain).function" }

	/// The userInfo key for source file paths in errors constructed by Result.
	static var fileKey: String { return "\(errorDomain).file" }

	/// The userInfo key for source file line numbers in errors constructed by Result.
	static var lineKey: String { return "\(errorDomain).line" }
    
    /// Constructs an error.
    ///
    /// - Parameters:
    ///   - message: Information regarding what went wrong.
    ///   - function: Information regarding which method caused the problem.
    ///   - file: Infomration regarding which file caused the problem.
    ///   - line: Information regarding which line caused the problem.
    /// - Returns: An error with the properties used to construct itself.
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

	// MARK: - Custom String Convertible
    
    /// Property to conform to `CustomStringConvertible`.
	var description: String {
		switch self {
		case let .success(value): return ".success(\(value))"
		case let .failure(error): return ".failure(\(error))"
		}
	}

	// MARK: - Custom Debug String Convertible

    /// Property to conform to `CustomDebugStringConvertible`.
	var debugDescription: String {
		return description
	}

	// MARK: - Result Protocol
    
    /// /// Property to conform to `ResultProtocol`.
	var result: Result<Value, Error> {
		return self
	}
}

extension Result where Error == ResultAnyError {
	
    /// Constructs a result from a function that uses `throw`, failing with `AnyError` if throws.
    ///
    /// - Parameter block: Closure to be executed.
	init(_ block: @autoclosure () throws -> Value) {
		self.init(attempt: block)
	}
    
    /// Constructs a result from a function that uses `throw`, failing with `AnyError` if throws.
    ///
    /// - Parameter block: Closure to be attempted.
	init(attempt block: () throws -> Value) {
		do {
			self = .success(try block())
		} catch {
			self = .failure(ResultAnyError(error))
		}
	}
}

// MARK: - Derive Result From Failable Closure
@available(*, deprecated, renamed: "Result.init(attempt:)")
func materialize<T>(_ f: () throws -> T) -> Result<T, ResultAnyError> {
	return Result(attempt: f)
}

@available(*, deprecated, renamed: "Result.init(_:)")
func materialize<T>(_ f: @autoclosure () throws -> T) -> Result<T, ResultAnyError> {
	return Result(f)
}

// MARK: - Error Convertible Conformance
extension NSError: ErrorConvertible {
    
    /// Method to conform to `ErrorConvertible`.
    ///
    /// - Parameter error: `Swift` error used to be cast into a `Result`.
    /// - Returns: A `Result` constructed from a `Swift` error.
	static func error(from error: Swift.Error) -> Self {
		func cast<T: NSError>(_ error: Swift.Error) -> T {
			return error as! T
		}

		return cast(error)
	}
}

// MARK: - Migration Support
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
///
/// This is convenient for wrapping Cocoa API which returns an object or `nil` + an error, by reference. e.g.:
///
/// Result.try { NSData(contentsOfURL: URL, options: .dataReadingMapped, error: $0) }
@available(*, unavailable, message: "This has been removed. Use `Result.init(attempt:)` instead. See https://github.com/antitypical/Result/issues/85 for the details.")
func `try`<T>(_ function: String = #function, file: String = #file, line: Int = #line, `try`: (NSErrorPointer) -> T?) -> Result<T, NSError> {
	fatalError()
}

/// Constructs a `Result` with the result of calling `try` with an error pointer.
///
/// This is convenient for wrapping Cocoa API which returns a `Bool` + an error, by reference. e.g.:
///
/// Result.try { NSFileManager.defaultManager().removeItemAtURL(URL, error: $0) }
@available(*, unavailable, message: "This has been removed. Use `Result.init(attempt:)` instead. See https://github.com/antitypical/Result/issues/85 for the details.")
func `try`(_ function: String = #function, file: String = #file, line: Int = #line, `try`: (NSErrorPointer) -> Bool) -> Result<(), NSError> {
	fatalError()
}

#endif
