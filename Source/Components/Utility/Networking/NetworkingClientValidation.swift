//
//  NetworkingClientValidation.swift
//  Client
//
//  Created by Christian Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

enum NetworkingClientValidation {
    case successCodes
}

extension NetworkingClientValidation {
    var range: ClosedRange<Int> {
        switch self {
        case .successCodes:
            return 200...299
        }
    }
}
