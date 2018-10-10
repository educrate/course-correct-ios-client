//
//  UIPickerCellConfig.swift
//  UIInlinePicker
//
//  Created by Ampe on 8/5/18.
//

import UIKit

struct UIInlinePickerCellConfig {
    let selectedTextColor: UIColor
    let selectedBackgroundColor: UIColor
    let selectedBorderColor: CGColor
    let selectedBorderWidth: CGFloat
    let unselectedTextColor: UIColor
    let unselectedBackgroundColor: UIColor
    let unselectedBorderColor: CGColor
    let unselectedBorderWidth: CGFloat
    let cornerRadius: CGFloat
    let spacing: UIEdgeInsets
    
    init(selectedTextColor: UIColor,
                selectedBackgroundColor: UIColor,
                selectedBorderColor: CGColor,
                selectedBorderWidth: CGFloat,
                unselectedTextColor: UIColor,
                unselectedBackgroundColor: UIColor,
                unselectedBorderColor: CGColor,
                unselectedBorderWidth: CGFloat,
                cornerRadius: CGFloat,
                spacing: UIEdgeInsets) {
        
        self.selectedTextColor = selectedTextColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.selectedBorderColor = selectedBorderColor
        self.selectedBorderWidth = selectedBorderWidth
        self.unselectedTextColor = unselectedTextColor
        self.unselectedBackgroundColor = unselectedBackgroundColor
        self.unselectedBorderColor = unselectedBorderColor
        self.unselectedBorderWidth = unselectedBorderWidth
        self.cornerRadius = cornerRadius
        self.spacing = spacing
    }
}

extension UIInlinePickerCellConfig {
    static let `default` = UIInlinePickerCellConfig(selectedTextColor: .white,
                                                             selectedBackgroundColor: .blue,
                                                             selectedBorderColor: UIColor.clear.cgColor,
                                                             selectedBorderWidth: 0,
                                                             unselectedTextColor: .black,
                                                             unselectedBackgroundColor: .clear,
                                                             unselectedBorderColor: UIColor.black.cgColor,
                                                             unselectedBorderWidth: 1,
                                                             cornerRadius: 3,
                                                             spacing: UIEdgeInsets(top: 10,
                                                                                   left: 20,
                                                                                   bottom: -10,
                                                                                   right: -20))
}
