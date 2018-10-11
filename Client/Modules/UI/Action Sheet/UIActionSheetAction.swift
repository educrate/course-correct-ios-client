//
//  UIActionSheetAction.swift
//  UIActionSheet
//
//  Created by Ampe on 8/1/18.
//

import Foundation

class UIActionSheetAction {
    let title: String?
    let style: UIActionSheetActionStyle
    let handler: ((UIActionSheetAction) -> Void)?
    
    init(title: String? = nil,
              style: UIActionSheetActionStyle,
              handler: ((UIActionSheetAction) -> Void)? = nil) {
        
        self.title = title
        self.style = style
        self.handler = handler
    }
}
