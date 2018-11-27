//
//  UICalendarViewEventCell.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UICalendarViewEventCell: UICollectionViewCell {
    
    // MARK: Properties
    private var event: UICalendarViewEvent?
    
    // MARK: View Outlets
    @IBOutlet private weak var leftImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var rightImageView: UIImageView!
}

// MARK: - Public Setup Methods
extension UICalendarViewEventCell {
    func set(_ calendarEvent: UICalendarViewEvent) {
        event = calendarEvent
    }
    
    func reload() {
        guard let event = event else {
            return
        }
        
        titleLabel.text = event.title
        detailLabel.text = event.time
        infoLabel.text = event.location
    }
}

private extension UICalendarViewEventCell {
    func style(_ configuration: Any) {
        layer.cornerRadius = 3
        layer.borderWidth = 1
        layer.borderColor = UIColor.darkGray.cgColor
    }
}
