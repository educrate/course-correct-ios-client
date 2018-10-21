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
    let placeholderText: String
    let cursorColor: UIColor
    let textColor: UIColor
    let placeholderColor: UIColor
    let underlineColor: UIColor
    let underlineThickness: CGFloat
    let thicknessChange: CGFloat
    let textAlignment: NSTextAlignment
    
    init(text: String,
                placeholderText: String,
                cursorColor: UIColor,
                textColor: UIColor,
                placeholderColor: UIColor,
                underlineColor: UIColor,
                underlineThickness: CGFloat,
                thicknessChange: CGFloat,
                textAlignment: NSTextAlignment) {
        
        self.text = text
        self.placeholderText = placeholderText
        self.cursorColor = cursorColor
        self.textColor = textColor
        self.placeholderColor = placeholderColor
        self.underlineColor = underlineColor
        self.underlineThickness = underlineThickness
        self.thicknessChange = thicknessChange
        self.textAlignment = textAlignment
    }
    
    init(placeholderText: String) {
        self.init(text: "",
                  placeholderText: placeholderText,
                  cursorColor: .gray,
                  textColor: .black,
                  placeholderColor: .gray,
                  underlineColor: .gray,
                  underlineThickness: 1.0,
                  thicknessChange: 1.0,
                  textAlignment: .left)
    }
    
    static let `default` = UIFieldConfiguration(placeholderText: "Placeholder")
}
