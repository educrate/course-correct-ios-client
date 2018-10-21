//
//  CreditCardTypeValidator.swift
//  Client
//
//  Created by Christian Ampe on 8/7/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class CreditCardTypeValidator {
    private let supportedCardTypes: [CreditCardType]
    
    init(_ supportedCardTypes: [CreditCardType] = CreditCardType.all) {
        
        self.supportedCardTypes = supportedCardTypes
    }
}

// MARK: - Public Methods
extension CreditCardTypeValidator {
    func state(prefix: String) -> CreditCardTypeValidationState {
        return CreditCardTypeValidationState(fromPrefix: prefix, supportedCards: supportedCardTypes)
    }
    
    func state(number: String) -> CreditCardTypeValidationState {
        return CreditCardTypeValidationState(fromNumber: number, supportedCards: supportedCardTypes)
    }
}
