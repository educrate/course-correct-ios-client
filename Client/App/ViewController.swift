//
//  ViewController.swift
//  Client
//
//  Created by Ampe on 9/18/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import UIKit

struct CalDay: CalendarDay {
    let date: CalendarDate
    let events: [CalendarEvent]
    
    init?(_ date: Date,
          events: [CalendarEvent]) {
        guard let date = CalendarDate(date) else {
            return nil
        }
        
        self.date = date
        self.events = events
    }
}

struct CalEvent: CalendarEvent {
}

class ViewController: UIViewController {
    @IBOutlet weak var calendarView: CalendarView!
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        calendarView.delegate = self
//        calendarView.dataSource = self
    }
}

//extension ViewController: CalendarViewDataSource {
//    let calendar: Calendar = {
//        var calendar = Calendar(identifier: .gregorian)
//        calendar.locale = Locale.current
//        return calendar
//    }()
//    
//    func day(for date: Date) -> CalendarDay? {
//        let event = CalEvent()
//        return CalDay(date, events: [event, event, event, event])
//    }
//}
//
//extension ViewController: CalendarViewDelegate {
//    
//}
