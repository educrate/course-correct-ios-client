//
//  UINavigationBar+Additions.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit.UINavigationBar

extension UINavigationBar {
    func makeTransparent() {
        setBackgroundImage(.empty, for: .default)
        shadowImage = .empty
    }
}
