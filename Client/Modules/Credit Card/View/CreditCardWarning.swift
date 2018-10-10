//
//  CreditCardWarning.swift
//  UICreditCard
//
//  Created by Ampe on 9/1/18.
//

import UIKit

struct CreditCardWarning {
    var text: String
    var color: UIColor
    
    init(text: String,
                color: UIColor) {
        
        self.text = text
        self.color = color
    }
}

extension CreditCardWarning {
    static let `default` = CreditCardWarning(text: "please enter your credit card information", color: .darkGray)
    static let defaultUnsupported = CreditCardWarning(text: "this card type is unsupported", color: .red)
    static let defaultInvalid = CreditCardWarning(text: "invalid card number entered", color: .red)
}
