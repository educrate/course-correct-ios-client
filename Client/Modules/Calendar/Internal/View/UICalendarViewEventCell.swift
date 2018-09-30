//
//  CalendarViewEventCell.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import UIKit

class UICalendarViewEventCell: UICollectionViewCell {
    
    
    // MARK: Properties
    
    private var event: CalendarEvent?
    
    
    // MARK: Views
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
}


// MARK: - Public Setup Methods

extension UICalendarViewEventCell {
    func setUp(_ calendarEvent: CalendarEvent) {
        event = calendarEvent
        
        titleLabel.text = calendarEvent.title
        detailLabel.text = calendarEvent.description
    }
}

extension UICalendarViewEventCell {
    static let identifier = "uicalendarvieweventcell"
}
