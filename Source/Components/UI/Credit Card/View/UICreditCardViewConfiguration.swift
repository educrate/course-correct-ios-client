//
//  UICreditCardViewConfiguration.swift
//  Client
//
//  Created by Ampe on 11/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UICreditCardViewConfiguration {
    let backgroundColor: UIColor
    let textColor: UIColor
    let borderColor: UIColor
    let borderWidth: CGFloat
    
    init(backgroundColor: UIColor = .white,
         textColor: UIColor = .black,
         borderColor: UIColor = .black,
         borderWidth: CGFloat = 1) {
        
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
}

extension UICreditCardViewConfiguration {
    static let `default` = UICreditCardViewConfiguration()
}
