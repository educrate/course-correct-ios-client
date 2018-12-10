//
//  EnterAccessCodeError.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

enum EnterAccessCodeError: Error {
    case emptyAccessCode
    case invalidAccessCode
}

extension EnterAccessCodeError: ClientReadable {
    var message: String {
        switch self {
        case .emptyAccessCode:
            return "Please enter the access code emailed to you."
        case .invalidAccessCode:
            return "You have entered an invalid access code, please try again."
        }
    }
}
