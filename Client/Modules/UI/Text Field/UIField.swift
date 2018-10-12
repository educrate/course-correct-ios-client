//
//  UIField.swift
//  UIField
//
//  Created by Ampe on 7/28/18.
//

import UIKit

// MARK: - Class Declaration
class UIFieldViewController: UIViewController {

    @IBOutlet private weak var field: UITextField!
    @IBOutlet private weak var underline: UIView!
    
    @IBOutlet private weak var underlineHeightConstraint: NSLayoutConstraint!
}

extension UIFieldViewController {
    var text: String? {
        return field.text
    }
}

extension UIFieldViewController {
    @IBAction func editingDidBegin(_ sender: UITextField, forEvent event: UIEvent) {
        
    }
    
    @IBAction func editingDidEnd(_ sender: UITextField, forEvent event: UIEvent) {
        
    }
}
