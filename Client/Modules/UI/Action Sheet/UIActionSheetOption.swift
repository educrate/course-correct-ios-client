//
//  UIActionSheetOption.swift
//  Client
//
//  Created by Christian Ampe on 8/1/18.
//  Copyright © 2018 Educrate. All rights reserved.
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
