//
//  CreditCard.swift
//  UICreditCard
//
//  Created by Ampe on 8/16/18.
//

import Foundation

class CreditCard {
    var metadata: CreditCardMetadata
    var warning: CreditCardWarning
    var style: CreditCardViewStyle
    
    init(metadata: CreditCardMetadata,
                warning: CreditCardWarning,
                style: CreditCardViewStyle) {
        
        self.metadata = metadata
        self.warning = warning
        self.style = style
    }
}

extension CreditCard {
    static let `default` = CreditCard(metadata: .default,
                                             warning: .default,
                                             style: .default)
}

extension CreditCard {
    static let empty = CreditCard(metadata: .empty,
                                         warning: .default,
                                         style: .default)
}
