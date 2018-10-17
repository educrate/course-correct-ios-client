//
//  UIActionSheetCell.swift
//  UIActionSheet
//
//  Created by Ampe on 8/1/18.
//

import UIKit

class UIActionSheetCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
}

extension UIActionSheetCell {
    func set(title: String) {
        titleLabel.text = title
    }
}
