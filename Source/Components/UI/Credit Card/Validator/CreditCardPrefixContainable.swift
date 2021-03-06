//
//  PrefixContainable.swift
//  Client
//
//  Created by Christian Ampe on 8/7/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Structure To Handle Prefixes
protocol CreditCardPrefixContainable {
    func hasCommonPrefix(with text: String) -> Bool
    var count: Int { get }
}

extension ClosedRange: CreditCardPrefixContainable {
    func hasCommonPrefix(with text: String) -> Bool {
        guard
            let lower = lowerBound as? String,
            let upper = upperBound as? String
            else {
                return false
        }
        
        let trimmedRange: ClosedRange<String> = {
            let length = text.count
            let trimmedStart = String(lower.prefix(length))
            let trimmedEnd = String(upper.prefix(length))
            return trimmedStart...trimmedEnd
        }()
        
        let trimmedText = String(text.prefix(trimmedRange.lowerBound.count))
        
        return trimmedRange ~= trimmedText
    }
    
    var count: Int {
        guard let upperBoundString = upperBound as? String else {
            assert(false, "improper use - only use this value on a string closed range")
            return -1
        }
        
        return upperBoundString.count
    }
}

extension String: CreditCardPrefixContainable {
    func hasCommonPrefix(with text: String) -> Bool {
        return hasPrefix(text) || text.hasPrefix(self)
    }
}
