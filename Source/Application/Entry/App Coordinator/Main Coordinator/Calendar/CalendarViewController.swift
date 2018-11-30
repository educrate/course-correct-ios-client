//
//  CalendarViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, CalendarViewProtocol {
    
    // MARK: Viper
	var presenter: CalendarPresenterProtocol?
    
    // MARK: View
    @IBOutlet private weak var calendarView: UICalendarView! {
        didSet {
            calendarView.dataSource = self
        }
    }
    
    // MARK: Deinit Verification
    deinit {
        print("deinitialized calendar screen")
    }
}

extension CalendarViewController: UICalendarViewDataSource {
    func events(for dateIndex: UICalendarViewDateComponents) -> [UICalendarViewEvent] {
        if dateIndex.day % 5 == 0 {
            return [UICalendarViewEvent(title: "Physics 101 with Dustin Tran", time: "10 AM-12:30 PM", location: "Langston Library"),
                    UICalendarViewEvent(title: "Physics 101 with Dustin Tran", time: "10 AM-12:30 PM", location: "Langston Library"),
                    UICalendarViewEvent(title: "Physics 101 with Dustin Tran", time: "10 AM-12:30 PM", location: "Langston Library")]
        } else {
            return []
        }
    }
}

extension CalendarViewController {
    @IBAction func profileButtonPressed(_ sender: UIButton, forEvent event: UIEvent) {
        presenter?.showProfile()
    }

    @IBAction func addEventPressed(_ sender: UIButton, forEvent event: UIEvent) {
        presenter?.createEvent()
    }
}
