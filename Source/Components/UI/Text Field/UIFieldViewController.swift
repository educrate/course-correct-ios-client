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

    // MARK: Views
    @IBOutlet private weak var field: UITextField!
    @IBOutlet private weak var underline: UIView!
    
    // MARK: Outlets
    @IBOutlet private weak var underlineHeightConstraint: NSLayoutConstraint!
    
    // MARK: Properties
    private var configuration: UIFieldConfiguration = .default
}

// MARK: - Action Outlets
extension UIFieldViewController {
    @IBAction func editingDidBegin(_ sender: UITextField, forEvent event: UIEvent) {
        adjustUnderlineHeight(true)
    }
    
    @IBAction func editingDidEnd(_ sender: UITextField, forEvent event: UIEvent) {
        adjustUnderlineHeight(false)
    }
}

// MARK: - Controller Lifecycle
extension UIFieldViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(for: configuration)
    }
}

// MARK: - Getters
extension UIFieldViewController {
    var text: String {
        return field.text ?? ""
    }
}

// MARK: - Public API
extension UIFieldViewController {
    func style(with configuration: UIFieldConfiguration) {
        self.configuration = configuration
    }
    
    func style(with placeholder: String) {
        configuration = UIFieldConfiguration(placeholder: placeholder)
    }
    
    func beginEditing() {
        field.becomeFirstResponder()
    }
    
    func endEditing() {
        field.resignFirstResponder()
    }
}

private extension UIFieldViewController {
    func configure(for configuration: UIFieldConfiguration) {
        field.text = configuration.text
        field.tintColor = configuration.cursorColor
        field.textColor = configuration.textColor
        field.textAlignment = configuration.textAlignment
        field.attributedPlaceholder = NSAttributedString(string: configuration.placeholder,
                                                         attributes: [NSAttributedString.Key.foregroundColor: configuration.placeholderColor])
        underline.backgroundColor = configuration.underlineColor
        underlineHeightConstraint.constant = configuration.underlineThickness
    }
    
    func adjustUnderlineHeight(_ isEditing: Bool) {
        underlineHeightConstraint.constant = isEditing ? configuration.underlineThickness + configuration.thicknessChange : configuration.underlineThickness
    }
}
