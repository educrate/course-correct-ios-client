//
//  CalendarViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, CalendarViewProtocol {
	var presenter: CalendarPresenterProtocol?
    
    deinit {
        print("deinitialized calendar screen")
    }
}

extension CalendarViewController {
    @IBAction func profileButtonPressed(_ sender: UIBarButtonItem) {
        presenter?.showProfile()
    }
    
    @IBAction func createEventPressed(_ sender: UIBarButtonItem) {
        presenter?.createEvent()
    }
}
