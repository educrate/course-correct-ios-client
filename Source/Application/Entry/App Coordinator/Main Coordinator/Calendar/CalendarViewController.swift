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
    private weak var calendar: UICalendarViewController!
    
    // MARK: Deinit Verification
    deinit {
        print("deinitialized calendar screen")
    }
}

extension CalendarViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueCase(for: segue) {
        case .calendar:
            calendar = segue.viewController()
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

extension CalendarViewController: SegueIdentifiable {
    enum Segue: String {
        case calendar = "Calendar"
    }
}
