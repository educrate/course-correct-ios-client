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
    var interactor: CalendarViewInteractor?
    
    // MARK: Initializers
    
    init(_ frame: CGRect,
         delegate: CalendarViewDelegate? = nil,
         dataSource: CalendarViewDataSource? = nil,
         interactor: CalendarViewInteractor? = nil) {
        
        self.delegate = delegate
        self.dataSource = dataSource
        self.interactor = interactor
        
        let calendarTableView = UITableView()
        self.calendarTableView = calendarTableView
        
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}

extension CalendarView {
    func didMoveTo(_ date: Date) {
        
    }
}

private extension CalendarView {
    func setUp() {
        setUpTableView()
    }
    
    // MARK: Table View Set Up
    
    func setUpTableView() {
        initializeTableView()
        styleTableView()
        constrainTableView()
    }
    
    func initializeTableView() {
        self.calendarTableView.delegate = self
        self.calendarTableView.dataSource = self
        
        self.calendarTableView.register(CalendarViewDayCell.self, forCellReuseIdentifier: "calendardaycell")
    }
    
    func styleTableView() {
        
    }
    
    func constrainTableView() {
        calendarTableView.translatesAutoresizingMaskIntoConstraints = false
        
        calendarTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        calendarTableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        calendarTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        calendarTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}

extension CalendarView: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataSource = dataSource else {
            return 0
        }
        
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataSource = dataSource else {
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
}
