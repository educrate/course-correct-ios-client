//
//  EnterStudentIdentifierError.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

enum EnterStudentIdentifierError: Error {
    case emptyIdentifier
    case invalidIdentifier
}

extension EnterStudentIdentifierError: ClientReadable {
    var message: String {
        switch self {
        case .emptyIdentifier:
            return "Please enter a valid student identifier."
        case .invalidIdentifier:
            return "The entered student identifier is invalid."
        }
    }
}
