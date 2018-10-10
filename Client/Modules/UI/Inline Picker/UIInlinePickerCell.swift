//
//  UIInlinePickerCell.swift
//  UIInlinePicker
//
//  Created by Ampe on 8/5/18.
//

import UIKit

class UIInlinePickerCell: UICollectionViewCell {
    
    // MARK: Storage
    weak var label: UILabel!
    
    // MARK: Properties
    var config: UIInlinePickerCellConfig = .default
    
    func update(_ string: String) {
        
        label.text = string
    }
    
    func initConfig(selectedTextColor: UIColor,
                         selectedBackgroundColor: UIColor,
                         selectedBorderColor: CGColor,
                         selectedBorderWidth: CGFloat,
                         unselectedTextColor: UIColor,
                         unselectedBackgroundColor: UIColor,
                         unselectedBorderColor: CGColor,
                         unselectedBorderWidth: CGFloat,
                         cornerRadius: CGFloat,
                         spacing: UIEdgeInsets) {
        
        config = UIInlinePickerCellConfig(selectedTextColor: selectedTextColor,
                                            selectedBackgroundColor: selectedBackgroundColor,
                                            selectedBorderColor: selectedBorderColor,
                                            selectedBorderWidth: selectedBorderWidth,
                                            unselectedTextColor: unselectedTextColor,
                                            unselectedBackgroundColor: unselectedBackgroundColor,
                                            unselectedBorderColor: unselectedBorderColor,
                                            unselectedBorderWidth: unselectedBorderWidth,
                                            cornerRadius: cornerRadius,
                                            spacing: spacing)
    }
    
    // MARK: Initalizers
    override init(frame: CGRect) {
       
        let label = UILabel()
        self.label = label
        
        super.init(frame: frame)
        
        initViews()
        
        addViews()
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        let label = UILabel()
        self.label = label
        
        super.init(coder: aDecoder)
        
        initViews()
        
        addViews()
        addConstraints()
    }
    
    override var isSelected: Bool {
        didSet {
            toggleSelection(isSelected)
        }
    }
}

extension UIInlinePickerCell {
    static let reuseIdentifier = "UIInlinePickerCell"
}

private extension UIInlinePickerCell {
    func initViews() {
        
        contentView.layer.cornerRadius = config.cornerRadius
        contentView.layer.masksToBounds = true
    }
    
    func addViews() {
        
        contentView.addSubview(label)
    }
    
    func addConstraints() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: config.spacing.top).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: config.spacing.left).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: config.spacing.right).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: config.spacing.bottom).isActive = true
    }
}

private extension UIInlinePickerCell {
    func toggleSelection(_ isSelected: Bool) {
        isSelected ? setSelected() : setUnselected()
    }
    
    func setSelected() {
        label.textColor = config.selectedTextColor
        
        contentView.layer.borderColor = config.selectedBorderColor
        contentView.layer.borderWidth = config.selectedBorderWidth
        
        contentView.backgroundColor = config.selectedBackgroundColor
    }
    
    func setUnselected() {
        label.textColor = config.unselectedTextColor
        
        contentView.layer.borderColor = config.unselectedBorderColor
        contentView.layer.borderWidth = config.unselectedBorderWidth
        
        contentView.backgroundColor = config.unselectedBackgroundColor
    }
}
