//
//  UIInlinePickerViewCellConfiguration.swift
//  Client
//
//  Created by Ampe on 11/15/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UIInlinePickerViewCellConfiguration {
    let selectedBackgroundColor: UIColor
    let selectedTextColor: UIColor
    let selectedBorderColor: UIColor
    let unselectedBackgroundColor: UIColor
    let unselectedTextColor: UIColor
    let unselectedBorderColor: UIColor
    
    init(selectedBackgroundColor: UIColor = .green,
         selectedTextColor: UIColor = .white,
         selectedBorderColor: UIColor = .clear,
         unselectedBackgroundColor: UIColor = .white,
         unselectedTextColor: UIColor = .black,
         unselectedBorderColor: UIColor = .black) {
        
        self.selectedBackgroundColor = selectedBackgroundColor
        self.selectedTextColor = selectedTextColor
        self.selectedBorderColor = selectedBorderColor
        self.unselectedBackgroundColor = unselectedBackgroundColor
        self.unselectedTextColor = unselectedTextColor
        self.unselectedBorderColor = unselectedBorderColor
    }
}

extension UIInlinePickerViewCellConfiguration {
    static let `default` = UIInlinePickerViewCellConfiguration()
}

