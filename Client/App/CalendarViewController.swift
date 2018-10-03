//
//  ViewController.swift
//  Client
//
//  Created by Ampe on 9/18/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedcalendarviewcontroller" {
            guard let destinationViewController = segue.destination as? UICalendarViewController else {
                return
            }
            
            destinationViewController.delegate = self
            destinationViewController.dataSource = self
        }
    }
}

extension CalendarViewController: UICalendarViewDataSource {
    func day(for date: CalendarDate) -> CalendarDay? {
        if date.dayNumber == 29, date.monthNumber == 9, date.yearNumber == 2018 {
            let calendarEventFirst = CalendarEvent(title: "Python 101A",
                                                   time: "12-1:30 PM",
                                                   location: "Langston Library")
            
            let calendarEventSecond = CalendarEvent(title: "Calculus 2B",
                                                    time: "11:15 AM-1 PM",
                                                    location: "Brandywine")
            
            return CalendarDay(date: date, events: [calendarEventFirst, calendarEventSecond, calendarEventFirst])
        } else {
            return nil
        }
    }
}

extension CalendarViewController: UICalendarViewDelegate {
    
}
