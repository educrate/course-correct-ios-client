//
//  UIDropdownCell.swift
//  Client
//
//  Created by Christian Ampe on 7/30/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UIDropdownCell: UITableViewCell {
    
    // MARK: Views
    
    /// Label used for displaying the main content of the cell
    @IBOutlet private weak var titleLabel: UILabel!
}

// MARK: - Public Methods
extension UIDropdownCell {
    
    /// Method used to set title of cell with a plain string.
    ///
    /// - Parameter text: Text to be set as the cell's title
    func setTitle(with text: String) {
        titleLabel.text = text
    }
    
    /// Method used to set title of cell with an attributed string.
    ///
    /// - Parameter attributedString: Text to be set as the cell's title
    func setTitle(with attributedString: NSAttributedString) {
        titleLabel.attributedText = attributedString
    }
}
