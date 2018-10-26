//
//  UIFieldConfiguration.swift
//  Client
//
//  Created by Christian Ampe on 7/29/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

// MARK: - Config For UI Field
struct UIFieldConfiguration {
    let text: String
    let placeholder: String
    let cursorColor: UIColor
    let textColor: UIColor
    let placeholderColor: UIColor
    let underlineColor: UIColor
    let underlineThickness: CGFloat
    let thicknessChange: CGFloat
    let textAlignment: NSTextAlignment
    
    init(text: String,
         placeholder: String,
         cursorColor: UIColor,
         textColor: UIColor,
         placeholderColor: UIColor,
         underlineColor: UIColor,
         underlineThickness: CGFloat,
         thicknessChange: CGFloat,
         textAlignment: NSTextAlignment) {
        
        self.text = text
        self.placeholder = placeholder
        self.cursorColor = cursorColor
        self.textColor = textColor
        self.placeholderColor = placeholderColor
        self.underlineColor = underlineColor
        self.underlineThickness = underlineThickness
        self.thicknessChange = thicknessChange
        self.textAlignment = textAlignment
    }
    
    init(placeholder: String) {
        self.init(text: "",
                  placeholder: placeholder,
                  cursorColor: .gray,
                  textColor: .black,
                  placeholderColor: .gray,
                  underlineColor: .gray,
                  underlineThickness: 1.0,
                  thicknessChange: 1.0,
                  textAlignment: .left)
    }
}

extension UIFieldConfiguration {
    static let `default` = UIFieldConfiguration(placeholder: "Placeholder")
}
