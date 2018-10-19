//
//  UIInlinePickerCell.swift
//  Client
//
//  Created by Christian Ampe on 8/5/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UIInlinePickerCell: UICollectionViewCell {
    
    // MARK: Views
    @IBOutlet private weak var label: UILabel!
}

extension UIInlinePickerCell {
    func setTitle(_ text: String) {
        label.text = text
    }
}

extension UIInlinePickerCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        constrainLabel()
        layer.cornerRadius = 3
        layer.borderWidth = 1
        layer.masksToBounds = true
        toggleSelection(isSelected)
    }
}

extension UIInlinePickerCell {
    override var isSelected: Bool {
        didSet {
            toggleSelection(isSelected)
        }
    }
}

private extension UIInlinePickerCell {
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

private extension UIInlinePickerCell {
    func constrainLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}
