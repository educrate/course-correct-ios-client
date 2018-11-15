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
}

extension UIInlinePickerViewCell {
    func setTitle(_ text: String) {
        label.text = text
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
        label.textColor = .white
        layer.borderColor = UIColor.clear.cgColor
        backgroundColor = .orange
    }
    
    func setUnselected() {
        label.textColor = .black
        layer.borderColor = UIColor.black.cgColor
        backgroundColor = .clear
    }
}

private extension UIInlinePickerViewCell {
    func style() {
        layer.cornerRadius = 3
        layer.borderWidth = 1
        layer.masksToBounds = true
    }
}
