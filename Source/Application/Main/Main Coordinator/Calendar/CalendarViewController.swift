//
//  CalendarViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, CalendarViewProtocol {
    
    // MARK: - Viper Components
	var presenter: CalendarPresenterProtocol?
    
    // MARK: - View Outlets
    @IBOutlet private weak var calendarView: UICalendarView!
    
    // MARK: - Deinit Verification
    deinit {
        print("deinitialized calendar screen")
    }
}

// MARK: - Controller Lifecycle
extension CalendarViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.dataSource = self
    }
}

// MARK: - IBActions
private extension CalendarViewController {
    @IBAction func profileButtonPressed(_ sender: UIButton, forEvent event: UIEvent) {
        presenter?.showProfile()
    }
    
    @IBAction func addEventPressed(_ sender: UIButton, forEvent event: UIEvent) {
        presenter?.createEvent()
    }
}

extension CalendarViewController: UICalendarViewDataSource {
    func numberOfMonths(in calendarView: UICalendarView) -> Int {
        return 12
    }
    
    func calendarView(_ calendarView: UICalendarView, numberOfDaysInSection section: Int) -> Int {
        return 31
    }
    
    func calendarView(_ calendarView: UICalendarView,
                      dayForItemAt indexPath: IndexPath) -> UICalendarViewDay {
        
        return UICalendarViewDay(description: UICalendarViewDayDescription(day: indexPath.row + 1,
                                                                    month: indexPath.section + 1,
                                                                    year: 2018 + (indexPath.section / 12),
                                                                    dayNameShort: "Fri",
                                                                    monthNameShort: "Jan",
                                                                    monthName: "January"),
                                 events: [UICalendarViewEvent(title: "Physics 7C with Dustin Tran",
                                                              time: "12-1:15 PM",
                                                              location: "Langston Library")])
    }
}

extension CalendarViewController {
    func didCreateEvent(_ event: Any) {
        
    }
}
