//
//  UICreditCardViewMetadata.swift
//  Client
//
//  Created by Ampe on 11/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UICreditCardViewMetadata {
    let logo: UIImage
    let number: Int
    let cvv: Int
    let expiration: Date
    let name: String
    
    init(logo: UIImage = #imageLiteral(resourceName: "mastercard"),
         number: Int = 5500000000000004,
         cvv: Int = 398,
         expiration: Date = Date(timeIntervalSince1970: 2000000000),
         name: String = "Christian R. Ampe") {
        
        self.logo = logo
        self.number = number
        self.cvv = cvv
        self.expiration = expiration
        self.name = name
    }
}

extension UICreditCardViewMetadata {
    static let `default` = UICreditCardViewMetadata()
}
