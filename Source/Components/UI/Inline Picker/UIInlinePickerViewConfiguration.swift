//
//  UIInlinePickerViewConfiguration.swift
//  Client
//
//  Created by Christian Ampe on 11/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UIInlinePickerViewConfiguration {
    let allowsMultipleSelection: Bool
    let cellConfiguration: UIInlinePickerViewCellConfiguration
    
    init(allowsMultipleSelection: Bool = false,
         cellConfiguration: UIInlinePickerViewCellConfiguration = .default) {
        self.allowsMultipleSelection = allowsMultipleSelection
        self.cellConfiguration = cellConfiguration
    }
}

extension UIInlinePickerViewConfiguration {
    static let `default` = UIInlinePickerViewConfiguration()
}
