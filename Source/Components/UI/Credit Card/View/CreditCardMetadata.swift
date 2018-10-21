//
//  CreditCardMetadata.swift
//  Client
//
//  Created by Christian Ampe on 9/1/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreditCardMetadata {
    var number: String
    var cvv: String
    var expiration: String
    var name: String
    var logo: UIImage?
    
    init(number: String,
                cvv: String,
                expiration: String,
                name: String,
                logo: UIImage?) {
        
        self.number = number
        self.cvv = cvv
        self.expiration = expiration
        self.name = name
        self.logo = logo
    }
}

extension CreditCardMetadata {
    static let `default` = CreditCardMetadata(number: CreditCardViewConstants.defaultNumber,
                                                     cvv: CreditCardViewConstants.defaultCVV,
                                                     expiration: CreditCardViewConstants.defaultExpiration,
                                                     name: CreditCardViewConstants.defaultName,
                                                     logo: CreditCardViewConstants.defaultLogo)
}

extension CreditCardMetadata {
    static let empty = CreditCardMetadata(number: "",
                                                 cvv: "",
                                                 expiration: "",
                                                 name: "",
                                                 logo: nil)
}
