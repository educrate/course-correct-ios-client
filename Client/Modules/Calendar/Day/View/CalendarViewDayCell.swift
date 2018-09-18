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
    
    // MARK: Views
    
    /// holds the information surrounding
    /// the day of the month and the day of the week
    private let dayLabel: UILabel!
    
    /// contains all the events for a single day
    /// one cell per event
    private let dayScheduleTableView: UITableView!
    
    // MARK: Protocols
    
    var delegate: CalendarViewDayDelegate?
    var dataSource: CalendarViewDayDataSource?
    
    // MARK: Initializers
    
    init(delegate: CalendarViewDayDelegate? = nil,
         dataSource: CalendarViewDayDataSource? = nil) {
        
        self.delegate = delegate
        self.dataSource = dataSource
        
        let dayScheduleTableView = UITableView()
        self.dayScheduleTableView = dayScheduleTableView
        
        self.dayScheduleTableView.delegate = self
        self.dayScheduleTableView.dataSource = self
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}

extension CalendarViewDayCell: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataSource = dataSource else {
            return 0
        }
        
        return dataSource.calendarViewDayCell(self, numberOfRowsInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataSource = dataSource else {
            return UITableViewCell()
        }
        
        return dataSource.calendarViewDayCell(self, cellForRowAt: indexPath)
    }
}
