//
//  UIDropDownViewCell.swift
//  Client
//
//  Created by Ampe on 11/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

final class UIDropDownViewCell: UITableViewCell {
    
    // MARK: Views
    
    /// Label used for displaying the main content of the cell
    @IBOutlet private weak var titleLabel: UILabel!
}

// MARK: - Public Methods
extension UIDropDownViewCell {
    
    /// Method used to set title of cell with a plain string.
    ///
    /// - Parameter text: Text to be set as the cell's title
    func set(_ text: String) {
        titleLabel.text = text
    }
    
    /// Method used to set title of cell with an attributed string.
    ///
    /// - Parameter attributedString: Text to be set as the cell's title
    func set(_ attributedString: NSAttributedString) {
        titleLabel.attributedText = attributedString
    }
}

