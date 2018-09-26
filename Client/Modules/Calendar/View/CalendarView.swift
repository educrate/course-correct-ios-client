//
//  CalendarView.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import UIKit

class CalendarView: UIView {
    
    
    // MARK: Properties
    
    private var date: Date
    
    
    // MARK: Views
    
    /// encompasing table view which holds
    /// the date object as well as the
    /// table view for a single day
    private weak var calendarTableView: UITableView!
    
    
    // MARK: Protocols
    
    var delegate: CalendarViewDelegate?
    var dataSource: CalendarViewDataSource?
    
    
    // MARK: Initializers
    
    init(_ frame: CGRect,
         date: Date = Date(),
         delegate: CalendarViewDelegate? = nil,
         dataSource: CalendarViewDataSource? = nil) {
        
        self.date = date
        
        self.delegate = delegate
        self.dataSource = dataSource
        
        let calendarTableView = UITableView()
        self.calendarTableView = calendarTableView
        
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.date = Date()
        
        let calendarTableView = UITableView()
        self.calendarTableView = calendarTableView
        
        super.init(coder: aDecoder)
        
        setUp()
    }
}


// MARK: - Public Update Methods

extension CalendarView {
    func moveTo(_ date: Date) {
        self.date = date
    }
}


// MARK: - Set Up Methods

private extension CalendarView {
    func setUp() {
        setUpTableView()
    }
    
    
    // MARK: Table View Set Up
    
    func setUpTableView() {
        initializeTableView()
        constrainTableView()
    }
    
    func initializeTableView() {
        self.calendarTableView.delegate = self
        self.calendarTableView.dataSource = self
        
        self.calendarTableView.register(CalendarViewDayCell.self,
                                        forCellReuseIdentifier: CalendarViewDayCell.identifier)
    }
    
    func constrainTableView() {
        calendarTableView.translatesAutoresizingMaskIntoConstraints = false
        
        calendarTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        calendarTableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        calendarTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        calendarTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}


// MARK: - Table View Data Source Conformation

extension CalendarView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
        
        guard let dataSource = dataSource else {
            return 0
        }
        
        let events = dataSource.day(for: date).events
        
        return events.count
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let dataSource = dataSource else {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CalendarViewDayCell.identifier,
                                                       for: indexPath) as? CalendarViewDayCell else {
            return UITableViewCell()
        }
        
        let day = dataSource.day(for: date)
        
        cell.setUp(day)
        
        return cell
    }
}


// MARK: - Table View Delegate Conformation

extension CalendarView: UITableViewDelegate {
    
}
