//
//  UIInputFieldConfiguration.swift
//  Client
//
//  Created by Ampe on 11/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

// MARK: - Configuration For UI Field
struct UIInputFieldConfiguration {
    let text: String
    let placeholder: String
    let textColor: UIColor
    let cursorColor: UIColor
    let placeholderColor: UIColor
    let underlineColor: UIColor
    let underlineThickness: CGFloat
    let thicknessChange: CGFloat
    let textAlignment: NSTextAlignment
    let autocapitalizationType: UITextAutocapitalizationType
    let autocorrectionType: UITextAutocorrectionType
    let spellCheckingType: UITextSpellCheckingType
    let smartQuotesType: UITextSmartQuotesType
    let smartDashesType: UITextSmartDashesType
    let smartInsertDeleteType: UITextSmartInsertDeleteType
    let keyboardType: UIKeyboardType
    let keyboardAppearance: UIKeyboardAppearance
    let returnKeyType: UIReturnKeyType
    let enablesReturnKeyAutomatically: Bool
    let isSecureTextEntry: Bool
    
    init(text: String = "",
         placeholder: String = "",
         textColor: UIColor = .black,
         cursorColor: UIColor = .darkGray,
         placeholderColor: UIColor = .darkGray,
         underlineColor: UIColor = .darkGray,
         underlineThickness: CGFloat = 1.0,
         thicknessChange: CGFloat = 1.0,
         textAlignment: NSTextAlignment = .left,
         autocapitalizationType: UITextAutocapitalizationType = .none,
         autocorrectionType: UITextAutocorrectionType = .no,
         spellCheckingType: UITextSpellCheckingType = .no,
         smartQuotesType: UITextSmartQuotesType = .no,
         smartDashesType: UITextSmartDashesType = .no,
         smartInsertDeleteType: UITextSmartInsertDeleteType = .no,
         keyboardType: UIKeyboardType = .default,
         keyboardAppearance: UIKeyboardAppearance = .default,
         returnKeyType: UIReturnKeyType = .default,
         enablesReturnKeyAutomatically: Bool = false,
         isSecureTextEntry: Bool = false) {
        
        self.text = text
        self.placeholder = placeholder
        self.textColor = textColor
        self.cursorColor = cursorColor
        self.placeholderColor = placeholderColor
        self.underlineColor = underlineColor
        self.underlineThickness = underlineThickness
        self.thicknessChange = thicknessChange
        self.textAlignment = textAlignment
        self.autocapitalizationType = autocapitalizationType
        self.autocorrectionType = autocorrectionType
        self.spellCheckingType = spellCheckingType
        self.smartQuotesType = smartQuotesType
        self.smartDashesType = smartDashesType
        self.smartInsertDeleteType = smartInsertDeleteType
        self.keyboardType = keyboardType
        self.keyboardAppearance = keyboardAppearance
        self.returnKeyType = returnKeyType
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        self.isSecureTextEntry = isSecureTextEntry
    }
}

extension UIInputFieldConfiguration {
    static let `default` = UIInputFieldConfiguration()
}
