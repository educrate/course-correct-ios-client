//
//  CalendarViewDayCell.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import UIKit

/// this cell holds all the data for a single calendar day
/// contains a date label on the left
/// contains a table view in the middle
public class CalendarViewDayCell: UITableViewCell {
    
    /// holds the information surrounding
    /// the day of the month and the day of the week
    private let dayLabel: UILabel
    
    /// contains all the events for a single day
    /// one cell per event
    private let dayScheduleTableView: UITableView
}
