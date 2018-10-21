//
//  CalendarViewEventCell.swift
//  Client
//
//  Created by Christian Ampe on 9/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UICalendarViewEventCell: UICollectionViewCell {
    
    
    // MARK: Properties
    
    private var event: CalendarEvent?
    
    
    // MARK: Views
    
    @IBOutlet
    weak var leftImageView: UIImageView!
    
    @IBOutlet
    weak var titleLabel: UILabel!
    
    @IBOutlet
    weak var detailLabel: UILabel!
    
    @IBOutlet
    weak var infoLabel: UILabel!
    
    @IBOutlet
    weak var rightImageView: UIImageView!
}


// MARK: - Public Setup Methods

extension UICalendarViewEventCell {
    func setUp(_ calendarEvent: CalendarEvent) {
        event = calendarEvent
        
        layer.cornerRadius = 3
        layer.borderWidth = 1
        layer.borderColor = UIColor.darkGray.cgColor
        
        titleLabel.text = calendarEvent.title
        detailLabel.text = calendarEvent.time
        infoLabel.text = calendarEvent.location
    }
}

extension UICalendarViewEventCell {
    static let identifier = "uicalendarvieweventcell"
    static let defaultHeight: CGFloat = 60
    static let interitemSpacing: CGFloat = 8
    static let lineSpacing: CGFloat = 8
}
