//
//  UIActionSheetOption.swift
//  UIActionSheet
//
//  Created by Ampe on 8/1/18.
//

import Foundation

class UIActionSheetOption {
    let title: String
    let action: (() -> Void)?
    
    init(title: String,
         action: (() -> Void)? = nil) {
        self.title = title
        self.action = action
    }
}
