//
//  SignInError.swift
//  Client
//
//  Created by Christian Ampe on 10/16/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

enum SignInError: Error {
    case emptyEmail
    case emptyPassword
    case invalidCredentials
}

extension SignInError: ClientReadable {
    var message: String {
        switch self {
        case .emptyEmail:
            return "Please enter a valid email address."
        case .emptyPassword:
            return "Please enter your password."
        case .invalidCredentials:
            return "The email or password you entered is incorrect."
        
        }
    }
}
