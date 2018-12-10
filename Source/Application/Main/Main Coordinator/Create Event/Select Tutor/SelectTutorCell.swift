//
//  SelectTutorCell.swift
//  Client
//
//  Created by Christian Ampe on 11/4/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectTutorCell: UITableViewCell {
    
    // MARK: View Outlets
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var tutorNameLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
}

extension SelectTutorCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        style()
    }
}

private extension SelectTutorCell {
    func style() {
        profileImageView.round()
    }
}
