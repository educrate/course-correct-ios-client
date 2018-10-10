//
//  CreditCardTypeValidator.swift
//  UIPaymentMethod
//
//  Created by Ampe on 8/7/18.
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
