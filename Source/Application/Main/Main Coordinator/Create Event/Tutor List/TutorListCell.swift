//
//  TutorListCell.swift
//  Client
//
//  Created by Christian Ampe on 11/4/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorListCell: UITableViewCell {
    
    // MARK: - View Outlets
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var tutorNameLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
}

// MARK: - Cell Lifecycle
extension TutorListCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        style()
    }
}

private extension TutorListCell {
    func style() {
        profileImageView.round()
    }
}
