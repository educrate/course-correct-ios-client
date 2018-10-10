//
//  StringProtocol+Capitalization.swift
//  Client
//
//  Created by Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

extension StringProtocol {
    var firstCapitalized: String {
        guard let first = first else {
            return ""
        }
        
        return String(first).capitalized + dropFirst()
    }
}
