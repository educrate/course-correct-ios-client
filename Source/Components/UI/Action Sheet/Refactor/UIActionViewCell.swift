//
//  UIActionViewCell.swift
//  Client
//
//  Created by Ampe on 11/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

final class UIActionViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
}

extension UIActionViewCell {
    func set(title: String) {
        titleLabel.text = title
    }
}
