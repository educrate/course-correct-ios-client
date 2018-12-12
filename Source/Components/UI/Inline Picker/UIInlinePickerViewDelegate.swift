//
//  UIInlinePickerViewDelegate.swift
//  Client
//
//  Created by Ampe on 12/12/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

protocol UIInlinePickerViewDelegate: class {
    func inlinePickerView(_ inlinePickerView: UIInlinePickerView, didSelectItemWith title: String)
}
