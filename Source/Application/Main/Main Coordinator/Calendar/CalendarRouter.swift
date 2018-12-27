//
//  CalendarRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CalendarRouter: CalendarWireframeProtocol {
    weak var viewController: UIViewController?
    weak var delegate: CalendarDelegate?
}

extension CalendarRouter {
    func presentEvent() {
        viewController?.show(EventBuilder().create(), sender: nil)
    }
    
    func presentCreateEvent(_ delegate: CreateEventDelegate?) {
        viewController?.show(CreateEventBuilder().create(delegate), sender: nil)
    }
    
    func presentProfile() {
        viewController?.show(ProfileOverviewBuilder().create(self), sender: nil)
    }
}

extension CalendarRouter {
    func profileOverviewRouter(_ profileOverviewRouter: ProfileOverviewRouter, didSignOut user: String) {
        delegate?.calendarRouter(self, didSignOut: "user signed out")
    }
    
    func unwind() {
        if let viewController = viewController {
            viewController.navigationController?.popToViewController(viewController, animated: true)
        }
    }
}
