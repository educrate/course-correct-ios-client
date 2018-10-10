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
    let handler: ((UIActionSheetAction) -> Swift.Void)?
    
    init(title: String? = nil,
              style: UIActionSheetActionStyle,
              handler: ((UIActionSheetAction) -> Swift.Void)? = nil) {
        
        self.title = title
        self.style = style
        self.handler = handler
    }
}
