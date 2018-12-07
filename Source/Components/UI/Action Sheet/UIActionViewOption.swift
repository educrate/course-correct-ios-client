//
//  UIActionViewOption.swift
//  Client
//
//  Created by Christian Ampe on 11/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UIActionViewOption {
    let title: String
    let action: (() -> Void)?
    
    init(title: String,
         action: (() -> Void)? = nil) {
        self.title = title
        self.action = action
    }
}
