//
//  UICreditCardViewMetadata.swift
//  Client
//
//  Created by Ampe on 11/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UICreditCardViewMetadata {
    let number: String
    let cvv: String
    let expiration: String
    let name: String
    let logo: UIImage?
    
    init(logo: UIImage? = nil,
         number: String = "",
         cvv: String = "",
         expiration: String = "",
         name: String = "") {
        
        self.logo = logo
        self.number = number
        self.cvv = cvv
        self.expiration = expiration
        self.name = name
    }
}

extension UICreditCardViewMetadata {
    static let empty = UICreditCardViewMetadata()
    static let `default` = UICreditCardViewMetadata(logo: #imageLiteral(resourceName: "mastercard"),
                                                    number: "•••• •••• •••• ••••",
                                                    cvv: "•••",
                                                    expiration: "10/21",
                                                    name: "Christian R. Ampe")
}
