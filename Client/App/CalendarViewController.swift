//
//  ViewController.swift
//  Client
//
//  Created by Ampe on 9/18/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    @IBOutlet weak var calendarViewController: UICalendarViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarViewController.delegate = self
        calendarViewController.dataSource = self
    }
}

extension CalendarViewController: UICalendarViewDataSource {
    func day(for date: CalendarDate) -> CalendarDay? {
        if date.dayNumber == 29, date.monthNumber == 9, date.yearNumber == 2018 {
            let calendarEvent = CalendarEvent(title: "Learining Python With Dustin Tran", description: "11:30 AM-2:45 PM at Langston Library")
            return CalendarDay(date: date, events: [calendarEvent, calendarEvent, calendarEvent])
        } else {
            return nil
        }
    }
}

extension CalendarViewController: UICalendarViewDelegate {
    
}
