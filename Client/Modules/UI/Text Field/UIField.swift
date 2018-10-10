//
//  UIField.swift
//  UIField
//
//  Created by Ampe on 7/28/18.
//

import UIKit

// MARK: - Class Declaration
@IBDesignable
class UIField: UIView {
    
    // MARK: Views
    private weak var textField: UITextField!
    private weak var underline: UIView!
    
    // MARK: Properties
    weak var underlineHeightConstraint: NSLayoutConstraint!
    
    // MARK: IBInspectables
    @IBInspectable
    var text: String = UIFieldConfiguration.default.text {
        didSet {
            textField.text = text
        }
    }
    
    @IBInspectable
    var placeholderText: String = UIFieldConfiguration.default.placeholderText {
        didSet {
            textField.placeholder = placeholderText
        }
    }
    
    @IBInspectable
    var placeholderColor: UIColor = UIFieldConfiguration.default.placeholderColor {
        didSet {
            textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes:[NSAttributedString.Key.foregroundColor: placeholderColor])
        }
    }
    
    @IBInspectable
    var cursorColor: UIColor = UIFieldConfiguration.default.cursorColor {
        didSet {
            textField.tintColor = cursorColor
        }
    }
    
    @IBInspectable
    var textColor: UIColor = UIFieldConfiguration.default.textColor {
        didSet {
            textField.textColor = textColor
        }
    }
    
    @IBInspectable
    var underlineColor: UIColor = UIFieldConfiguration.default.underlineColor {
        didSet {
            underline.backgroundColor = underlineColor
        }
    }
    
    @IBInspectable
    var underlineThickness: CGFloat = UIFieldConfiguration.default.underlineThickness {
        didSet {
            underlineHeightConstraint.constant = underlineThickness
        }
    }
    
    @IBInspectable
    var textAlignment: Int = UIFieldConfiguration.default.textAlignment.rawValue {
        didSet {
            guard let alignment = NSTextAlignment(rawValue: textAlignment) else {
                
                assert(false, "use a valid alignment mapping integer (0-4)")
                return
            }
            
            textField.textAlignment = alignment
        }
    }
    
    @IBInspectable
    var thicknessChange: CGFloat = UIFieldConfiguration.default.thicknessChange
    
    // MARK: Required Initalizers
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override convenience init(frame: CGRect) {
        
        self.init(frame,
                  config: UIFieldConfiguration.default,
                  delegate: nil)
    }
    
    // MARK: Programmatic Initalizer
    init(_ frame: CGRect,
                config: UIFieldConfiguration,
                delegate: UIFieldDelegate?) {
        
        self.delegate = delegate
        
        let field = UITextField()
        textField = field
        
        let view = UIView()
        underline = view
        
        super.init(frame: frame)
        
        addViews()
        addContraints()
        
        initConfig(config)
    }
    
    // MARK: Storyboard Initalizer
    public required init?(coder aDecoder: NSCoder) {
        
        let field = UITextField()
        textField = field
        
        let view = UIView()
        underline = view
        
        super.init(coder: aDecoder)
        
        addViews()
        addContraints()
        
        initConfig()
    }
    
    // MARK: Setup Methods
    private func initConfig(_ config: UIFieldConfiguration = UIFieldConfiguration.default) {
        
        text = config.text
        placeholderText = config.placeholderText
        textColor = config.textColor
        placeholderColor = config.placeholderColor
        underlineColor = config.underlineColor
        underlineThickness = config.underlineThickness
        thicknessChange = config.thicknessChange
        textAlignment = config.textAlignment.rawValue
    }
    
    private func addViews() {
        
        addSubview(textField)
        addSubview(underline)
        
        textField.delegate = self
        
        textField.addTarget(self,
                            action: #selector(textFieldDidChange(_:)),
                            for: UIControl.Event.editingChanged)
    }
    
    private func addContraints() {
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        underline.translatesAutoresizingMaskIntoConstraints = false
        
        underline.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        underline.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        underline.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        let underlineHeightAnchor = underline.heightAnchor.constraint(equalToConstant: underlineThickness)
        underlineHeightAnchor.isActive = true
        
        underlineHeightConstraint = underlineHeightAnchor
    }
    
    // MARK: Storage
    var delegate: UIFieldDelegate?
}

// MARK: - Text Field Delegate Conformance
extension UIField: UITextFieldDelegate {
    public func textFieldDidBeginEditing() {
        delegate?.editingBegan(self)
        textField.tintColor = cursorColor
        underlineHeightConstraint.constant = underlineThickness + thicknessChange
    }
    
    public func textFieldDidEndEditing() {
        delegate?.editingEnded(self)
        underlineHeightConstraint.constant = underlineThickness
    }
    
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        text = textField.text ?? ""
        delegate?.textChanged(self)
    }
}
