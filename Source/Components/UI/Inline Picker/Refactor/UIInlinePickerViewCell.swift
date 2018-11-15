//
//  UIInlinePickerViewCell.swift
//  Client
//
//  Created by Ampe on 11/15/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UIInlinePickerViewCell: UICollectionViewCell {
    
    // MARK: Views
    @IBOutlet private weak var label: UILabel!
    
    // MARK: Properties
    private var configuration: UIInlinePickerViewCellConfiguration = .default
}

extension UIInlinePickerViewCell {
    func set(_ title: String) {
        label.text = title
    }
    
    func set(_ newConfiguration: UIInlinePickerViewCellConfiguration) {
        configuration = newConfiguration
    }
}

extension UIInlinePickerViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        style()
        toggleSelection(isSelected)
    }
}

extension UIInlinePickerViewCell {
    override var isSelected: Bool {
        didSet {
            toggleSelection(isSelected)
        }
    }
}

// MARK: - Selection Styling Logic
private extension UIInlinePickerViewCell {
    func toggleSelection(_ isSelected: Bool) {
        isSelected ? setSelected() : setUnselected()
    }
    
    func setSelected() {
        label.textColor = configuration.selectedTextColor
        backgroundColor = configuration.selectedBackgroundColor
        layer.borderColor = configuration.selectedBorderColor.cgColor
    }
    
    func setUnselected() {
        label.textColor = configuration.unselectedTextColor
        backgroundColor = configuration.unselectedBackgroundColor
        layer.borderColor = configuration.unselectedBorderColor.cgColor
    }
}

private extension UIInlinePickerViewCell {
    func style() {
        layer.cornerRadius = 3
        layer.borderWidth = 1
        layer.masksToBounds = true
    }
}
