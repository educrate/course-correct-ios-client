//
//  UIActionSheetCell.swift
//  Client
//
//  Created by Christian Ampe on 8/1/18.
//  Copyright © 2018 Educrate. All rights reserved.
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
