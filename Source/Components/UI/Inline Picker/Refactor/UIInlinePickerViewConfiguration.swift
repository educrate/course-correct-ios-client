//
//  UIInlinePickerViewConfiguration.swift
//  Client
//
//  Created by Ampe on 11/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UIInlinePickerConfiguration {
    let allowsMultipleSelection: Bool
    
    init(allowsMultipleSelection: Bool = false) {
        self.allowsMultipleSelection = allowsMultipleSelection
    }
}

extension UIInlinePickerConfiguration {
    static let `default` = UIInlinePickerConfiguration()
}
