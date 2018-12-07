//
//  UICreditCardViewConfiguration.swift
//  Client
//
//  Created by Christian Ampe on 11/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UICreditCardViewConfiguration {
    let backgroundColor: UIColor
    let textColor: UIColor
    let borderColor: UIColor
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    
    init(backgroundColor: UIColor = .white,
         textColor: UIColor = .black,
         borderColor: UIColor = .black,
         cornerRadius: CGFloat = 3,
         borderWidth: CGFloat = 1) {
        
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
    }
}

extension UICreditCardViewConfiguration {
    static let `default` = UICreditCardViewConfiguration()
}
