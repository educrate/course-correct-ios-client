//
//  CreatePasswordError.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

enum CreatePasswordError: Error {
    case emptyPassword
    case passwordsDoNotMatch
    case invalidPassword
}

extension CreatePasswordError: ClientReadable {
    var message: String {
        switch self {
        case .emptyPassword:
            return "Please enter a password for your account."
        case .passwordsDoNotMatch:
            return "Your passwords do not match."
        case .invalidPassword:
            return "Your password must be at least six characters in length."
        }
    }
}
