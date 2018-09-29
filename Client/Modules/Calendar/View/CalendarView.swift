//
//  CalendarView.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import UIKit

class CalendarView: UIView {
    
    
    // MARK: Views
    
    /// encompasing table view which holds
    /// the date object as well as the
    /// table view for a single day
    private weak var calendarTableView: UITableView!
    
    
    // MARK: Protocols
    
    var delegate: CalendarViewDelegate?
    var dataSource: CalendarViewDataSource?
    
    var controller: CalendarController
    
    private var cache: CalendarViewCache?
    
    
    // MARK: Initializers
    
    init(_ frame: CGRect,
         calendarConfiguration: CalendarConfiguration,
         calendarIdentifier: Calendar.Identifier,
         delegate: CalendarViewDelegate? = nil,
         dataSource: CalendarViewDataSource? = nil) {
        
        let newCalendarTableView = UITableView()
        calendarTableView = newCalendarTableView
        
        let calendarController = CalendarController(configuration: calendarConfiguration)
        controller = calendarController
        
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        let newCalendarTableView = UITableView()
        calendarTableView = newCalendarTableView
        
        let calendarController = CalendarController(configuration: .default)
        controller = calendarController
        
        super.init(coder: aDecoder)
        
        setUp()
    }
}


// MARK: - Public Update Methods

extension CalendarView {
    func moveTo(_ newDate: Date) {
        calendarTableView.reloadData()
    }
}


// MARK: - Set Up Methods

private extension CalendarView {
    func setUp() {
        addViews()
        initializeTableView()
        constrainTableView()
    }
    
    
    // MARK: Table View Set Up
    
    func addViews() {
        addSubview(calendarTableView)
    }
    
    func initializeTableView() {
        self.calendarTableView.delegate = self
        self.calendarTableView.dataSource = self
        
        self.calendarTableView.register(CalendarViewDayCell.self,
                                        forCellReuseIdentifier: CalendarViewDayCell.identifier)
    }
    
    func constrainTableView() {
        calendarTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        calendarTableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        calendarTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        calendarTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        calendarTableView.translatesAutoresizingMaskIntoConstraints = false
    }
}


// MARK: - Table View Data Source Conformation

extension CalendarView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return controller.dataSource.monthCount()
    }
    
    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
        
        guard let dayCount = controller.dataSource.days(in: section) else {
            assert(false, "apple api for date extraction has failed")
            return 0
        }
        
        return dayCount
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CalendarViewDayCell.identifier,
                                                       for: indexPath) as? CalendarViewDayCell else {
            return UITableViewCell()
        }
        
        let dayHelper = controller.dataSource.day(from: indexPath)
        
        guard let dateHelper = controller.dataSource.calendarDate(for: dayHelper) else {
            return UITableViewCell()
        }
        
        let day = CalendarDay(date: dateHelper, events: [])
        
        cell.setUp(day)
        
        return cell
    }
}


// MARK: - Table View Delegate Conformation

extension CalendarView: UITableViewDelegate {
   
}
