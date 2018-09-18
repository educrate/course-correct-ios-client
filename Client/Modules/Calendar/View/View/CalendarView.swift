//
//  CalendarView.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import UIKit

public class CalendarView: UIView {
    
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
         delegate: CalendarViewDelegate? = nil,
         dataSource: CalendarViewDataSource? = nil) {
        
        self.delegate = delegate
        self.dataSource = dataSource
        
        let calendarTableView = UITableView()
        self.calendarTableView = calendarTableView
        
        super.init(frame: frame)
        
        self.calendarTableView.delegate = self
        self.calendarTableView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}

extension CalendarView: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataSource = dataSource else {
            return 0
        }
        
        return dataSource.calendarView(self, numberOfRowsInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataSource = dataSource else {
            return UITableViewCell()
        }
        
        return dataSource.calendarView(self, cellForRowAt: indexPath)
    }
}
