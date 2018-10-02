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
            let calendarEventFirst = CalendarEvent(title: "Python with Dustin",
                                                   description: "11:30 AM-12:15 PM at Langston Library",
                                                   duration: 2400)
            
            let calendarEventSecond = CalendarEvent(title: "Calculus 2B with Christian",
                                                    description: "1-3 PM at Christian's",
                                                    duration: 7200)
            
            return CalendarDay(date: date, events: [calendarEventFirst, calendarEventSecond, calendarEventFirst])
        } else {
            return nil
        }
    }
}

extension CalendarViewController: UICalendarViewDelegate {
    
}
