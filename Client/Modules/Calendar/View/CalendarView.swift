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
    
    private var cache: CalendarViewCache?
    
    
    // MARK: Initializers
    
    init(_ frame: CGRect,
         date: Date = Date(),
         forwardOffset: DateOffsetHelper = DateOffsetHelper(component: .month, value: 6),
         backwardOffset: DateOffsetHelper = DateOffsetHelper(component: .month, value: 6),
         calendarIdentifier: Calendar.Identifier,
         delegate: CalendarViewDelegate? = nil,
         dataSource: CalendarViewDataSource? = nil) {
        
        let calendarTableView = UITableView()
        self.calendarTableView = calendarTableView
        
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        let calendarTableView = UITableView()
        self.calendarTableView = calendarTableView
        
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
    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CalendarViewDayCell.identifier,
                                                       for: indexPath) as? CalendarViewDayCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}


// MARK: - Table View Delegate Conformation

extension CalendarView: UITableViewDelegate {
   
}
