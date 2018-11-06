//
//  TutorProfileReviewCell.swift
//  Client
//
//  Created by Ampe on 11/5/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorProfileReviewCell: UITableViewCell {
    
    // MARK: View Outlets
    @IBOutlet private weak var reviewerProfileImageView: UIImageView!
    @IBOutlet private weak var reviewerNameLabel: UILabel!
    @IBOutlet private weak var reviewerCourseLabel: UILabel!
    @IBOutlet private weak var reviewerRatingLabel: UILabel!
    @IBOutlet private weak var reviewerQuoteLabel: UILabel!
}

extension TutorProfileReviewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        reviewerProfileImageView.round()
    }
}
