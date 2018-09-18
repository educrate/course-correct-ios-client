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
    private weak var dayLabel: UILabel!
    
    /// contains all the events for a single day
    /// one cell per event
    private weak var dayScheduleTableView: UITableView!
    
    // MARK: Protocols
    
    var delegate: CalendarViewDayDelegate?
    var dataSource: CalendarViewDayDataSource?
    
    // MARK: Initializers
    
    init(style: UITableViewCell.CellStyle,
         reuseIdentifier: String?,
         delegate: CalendarViewDayDelegate? = nil,
         dataSource: CalendarViewDayDataSource? = nil) {
        
        self.delegate = delegate
        self.dataSource = dataSource
        
        let dayScheduleTableView = UITableView()
        self.dayScheduleTableView = dayScheduleTableView
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.dayScheduleTableView.delegate = self
        self.dayScheduleTableView.dataSource = self
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}

private extension CalendarViewDayCell {
    func setUp() {
        setUpTableView()
    }
    
    // MARK: Table View Setup
    
    func setUpTableView() {
        initializeTableView()
        styleTableView()
        constrainTableView()
    }
    
    func initializeTableView() {
        self.dayScheduleTableView.delegate = self
        self.dayScheduleTableView.dataSource = self
        
        self.dayScheduleTableView.register(CalendarViewEventCell.self, forCellReuseIdentifier: "calendareventcell")
    }
    
    func styleTableView() {
        
    }
    
    func constrainTableView() {
        dayScheduleTableView.translatesAutoresizingMaskIntoConstraints = false
        
        dayScheduleTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dayScheduleTableView.leftAnchor.constraint(equalTo: dayLabel.rightAnchor, constant: 8).isActive = true
        dayScheduleTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        dayScheduleTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    // MARK: Day Label Setup
    
    func setUpDayLabel() {
        initializeDayLabel()
        styleDayLabel()
        constrainDayLabel()
    }
    
    func initializeDayLabel() {
        
    }
    
    func styleDayLabel() {
        
    }
    
    func constrainDayLabel() {
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dayLabel.topAnchor.constraint(equalTo: topAnchor)
        dayLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8)
    }
}

// MARK: - Table View Protocol Conformance

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
