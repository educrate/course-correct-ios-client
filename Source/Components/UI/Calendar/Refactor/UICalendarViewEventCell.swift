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
    
    /// contains the information regarding a single event
    private var event: UICalendarViewEvent?
    
    /// contains all the styling for the cell
    private var configuration: UICalendarViewEventCellConfiguration = .default
    
    // MARK: View Outlets
    @IBOutlet private weak var leftImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var rightImageView: UIImageView!
}

// MARK: - Public Setup Methods
extension UICalendarViewEventCell {
    func set(event: UICalendarViewEvent,
             _ configuration: UICalendarViewEventCellConfiguration) {
        
        self.event = event
        self.configuration = configuration
    }
    
    func reload() {
        guard let event = event else {
            return
        }
        
        layer.cornerRadius = configuration.cornerRadius
        layer.borderWidth = configuration.borderWidth
        layer.borderColor = configuration.borderColor.cgColor
        
        titleLabel.text = event.title
        detailLabel.text = event.time
        infoLabel.text = event.location
    }
}
