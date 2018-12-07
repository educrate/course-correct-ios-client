//
//  UIFieldView.swift
//  Client
//
//  Created by Christian Ampe on 11/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

// MARK: - Class Declaration
final class UIFieldView: XIBView {
    
    // MARK: View Outlets
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var underlineView: UIView!
    
    // MARK: Constraint Outlets
    @IBOutlet private weak var underlineViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: Properties
    private var configuration: UIFieldViewConfiguration = .default
}

// MARK: - Action Outlets
extension UIFieldView {
    @IBAction func editingDidBegin(_ sender: UITextField, forEvent event: UIEvent) {
        adjustUnderlineHeight(true)
    }
    
    @IBAction func editingDidEnd(_ sender: UITextField, forEvent event: UIEvent) {
        adjustUnderlineHeight(false)
    }
}

// MARK: - Controller Lifecycle
extension UIFieldView {
    override func awakeFromNib() {
        super.awakeFromNib()
        configure(configuration)
    }
}

// MARK: - Getters
extension UIFieldView {
    var text: String {
        return textField.text ?? ""
    }
}

// MARK: - Public API
extension UIFieldView {
    func beginEditing() {
        textField.becomeFirstResponder()
    }
    
    func endEditing() {
        textField.resignFirstResponder()
    }
    
    func set(_ newConfiguration: UIFieldViewConfiguration) {
        configuration = newConfiguration
    }
}

// MARK: Private Methods
private extension UIFieldView {
    func configure(_ configuration: UIFieldViewConfiguration) {
        underlineView.backgroundColor = configuration.underlineColor
        underlineViewHeightConstraint.constant = configuration.underlineThickness
        textField.text = configuration.text
        textField.tintColor = configuration.cursorColor
        textField.textColor = configuration.textColor
        textField.textAlignment = configuration.textAlignment
        textField.autocapitalizationType = configuration.autocapitalizationType
        textField.autocorrectionType = configuration.autocorrectionType
        textField.spellCheckingType = configuration.spellCheckingType
        textField.smartQuotesType = configuration.smartQuotesType
        textField.smartDashesType = configuration.smartDashesType
        textField.smartInsertDeleteType = configuration.smartInsertDeleteType
        textField.keyboardType = configuration.keyboardType
        textField.keyboardAppearance = configuration.keyboardAppearance
        textField.returnKeyType = configuration.returnKeyType
        textField.enablesReturnKeyAutomatically = configuration.enablesReturnKeyAutomatically
        textField.isSecureTextEntry = configuration.isSecureTextEntry
        textField.attributedPlaceholder = NSAttributedString(string: configuration.placeholder,
                                                         attributes: [NSAttributedString.Key.foregroundColor: configuration.placeholderColor])
    }
    
    func adjustUnderlineHeight(_ isEditing: Bool) {
        underlineViewHeightConstraint.constant = isEditing ? configuration.underlineThickness + configuration.thicknessChange : configuration.underlineThickness
    }
}
