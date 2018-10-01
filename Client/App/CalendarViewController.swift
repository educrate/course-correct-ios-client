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
            let calendarEvent = CalendarEvent(title: "Learining Python With Dustin Tran",
                                              description: "11:30 AM-2:45 PM at Langston Library",
                                              duration: 3600)
            
            return CalendarDay(date: date, events: [calendarEvent, calendarEvent, calendarEvent])
        } else {
            return nil
        }
    }
}

extension CalendarViewController: UICalendarViewDelegate {
    
}
