//
//  UIInlinePickerConfig.swift
//  UIInlinePicker
//
//  Created by Ampe on 8/4/18.
//

import UIKit

struct UIInlinePickerConfig {
    let padding: UIEdgeInsets
    let cellConfig: UIInlinePickerCellConfig
    
    init(padding: UIEdgeInsets,
                cellConfig: UIInlinePickerCellConfig) {
        
        self.padding = padding
        self.cellConfig = cellConfig
    }
}

extension UIInlinePickerConfig {
    static let `default` = UIInlinePickerConfig(padding: UIEdgeInsets(top: 20,
                                                                               left: 20,
                                                                               bottom: -20,
                                                                               right: -20),
                                                         cellConfig: .default)
}
