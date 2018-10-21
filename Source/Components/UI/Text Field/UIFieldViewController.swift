//
//  UIField.swift
//  UIField
//
//  Created by Christian Ampe on 7/28/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

// MARK: - Class Declaration
class UIFieldViewController: UIViewController {

    @IBOutlet private weak var field: UITextField!
    @IBOutlet private weak var underline: UIView!
    
    @IBOutlet private weak var underlineHeightConstraint: NSLayoutConstraint!
}

extension UIFieldViewController {
    var text: String {
        return field.text ?? ""
    }
}

extension UIFieldViewController {
    func beginEditing() {
        field.becomeFirstResponder()
    }
    
    func endEditing() {
        field.resignFirstResponder()
    }
}

extension UIFieldViewController {
    func setPlaceholder(_ text: String) {
        field.placeholder = text
    }
}

extension UIFieldViewController {
    @IBAction func editingDidBegin(_ sender: UITextField, forEvent event: UIEvent) {
        
    }
    
    @IBAction func editingDidEnd(_ sender: UITextField, forEvent event: UIEvent) {
        
    }
}
