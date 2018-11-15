//
//  UIInlinePickerViewConfiguration.swift
//  Client
//
//  Created by Ampe on 11/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UIInlinePickerViewConfiguration {
    let allowsMultipleSelection: Bool
    
    init(allowsMultipleSelection: Bool = false) {
        self.allowsMultipleSelection = allowsMultipleSelection
    }
}

extension UIInlinePickerViewConfiguration {
    static let `default` = UIInlinePickerViewConfiguration()
}
