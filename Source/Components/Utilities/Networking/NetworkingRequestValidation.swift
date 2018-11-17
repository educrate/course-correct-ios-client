//
//  NetworkingRequestValidation.swift
//  Client
//
//  Created by Christian Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

enum NetworkingRequestValidation {
    
    // filter for only 2xx http statuc codes
    case successCodes
}

extension NetworkingRequestValidation {
    
    /// static code ranges
    var range: ClosedRange<Int> {
        switch self {
        case .successCodes:
            return 200...299
        }
    }
}
