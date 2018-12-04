//
//  UICalendarViewEventCell.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UICalendarViewEventCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    /// Contains the information regarding a single event.
    private var event: UICalendarViewEvent?
    
    /// Contains all the styling for the cell.
    private var configuration: UICalendarViewEventCellConfiguration = .default
    
    // MARK: - View Outlets
    @IBOutlet private weak var leftImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var rightImageView: UIImageView!
}

// MARK: - Public Setup Methods
extension UICalendarViewEventCell {
    
    /// Method used for setting the day property.
    ///
    /// - Parameter event: Contains information pertinent the specifc event.
    func set(_ event: UICalendarViewEvent) {
        self.event = event
    }
    
    /// Method used for setting the configuration of this cell.
    ///
    /// - Parameter configuration: Contains information regarding the setup of this cell.
    func set(_ configuration: UICalendarViewEventCellConfiguration) {
        self.configuration = configuration
    }
    
    /// Method used to reload all inputs on the cell.
    /// Call after setting the event or configuration.
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
