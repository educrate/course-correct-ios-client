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
class CalendarViewDayCell: UITableViewCell {
    
    
    // MARK: Properties
    
    private var day: CalendarDay?
    
    
    // MARK: Views
    
    /// holds the information surrounding
    /// the day of the month and the day of the week
    private weak var dayLabel: CalendarViewDayLabel!
    
    /// contains all the events for a single day
    /// one cell per event
    private weak var dayScheduleTableView: UITableView!
    

    // MARK: Initializers
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let tv = UITableView()
        dayScheduleTableView = tv
        
        let dl = CalendarViewDayLabel()
        dayLabel = dl
        
        dayScheduleTableView.delegate = self
        dayScheduleTableView.dataSource = self
        
        initializeViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let tv = UITableView()
        dayScheduleTableView = tv
        
        let dl = CalendarViewDayLabel()
        dayLabel = dl
        
        dayScheduleTableView.delegate = self
        dayScheduleTableView.dataSource = self
        
        initializeViews()
    }
}


// MARK: - Public Setup Methods

extension CalendarViewDayCell {
    func setUp(_ calendarDay: CalendarDay) {
        day = calendarDay
    }
}


// MARK: - Private View Setup Methods

private extension CalendarViewDayCell {
    func initializeViews() {
        addViews()
        setUpViews()
        addConstraints()
    }
    
    
    // MARK: Initializer Methods
    
    func addViews() {
        addSubview(dayLabel)
        addSubview(dayScheduleTableView)
    }
    
    func setUpViews() {
        setUpTableView()
    }
    
    func addConstraints() {
        constrainDayLabel()
        constrainTableView()
    }
    
    
    // MARK: View Setup

    func setUpTableView() {
        dayScheduleTableView.delegate = self
        dayScheduleTableView.dataSource = self
        dayScheduleTableView.register(CalendarViewEventCell.self, forCellReuseIdentifier: "calendareventcell")
    }
    
    
    // MARK: View Contraining
    
    func constrainDayLabel() {
        dayLabel.topAnchor.constraint(equalTo: topAnchor)
        dayLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16)
        dayLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constrainTableView() {
        dayScheduleTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dayScheduleTableView.leftAnchor.constraint(equalTo: dayLabel.rightAnchor, constant: 8).isActive = true
        dayScheduleTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        dayScheduleTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        dayScheduleTableView.translatesAutoresizingMaskIntoConstraints = false
    }
}


// MARK: - Table View Protocol Conformance

extension CalendarViewDayCell: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let day = day else {
            return 0
        }
        
        return day.events.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let day = day else {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CalendarViewEventCell.identifier,
                                                       for: indexPath) as? CalendarViewEventCell else {
            return UITableViewCell()
        }
        
        let events = day.events
        let rowIndex = indexPath.row
        
        guard events.indices.contains(rowIndex) else {
            return UITableViewCell()
        }
        
        let event = events[rowIndex]
        
        cell.setUp(event)
        
        return cell
    }
}

extension CalendarViewDayCell {
    static let identifier = "calendardaycell"
}
