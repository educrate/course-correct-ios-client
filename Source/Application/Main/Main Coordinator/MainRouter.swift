//
//  MainRouter.swift
//  Client
//
//  Created Ampe on 10/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class MainRouter: MainWireframeProtocol {
    weak var viewController: UINavigationController?
}

extension MainRouter {
    func presentCalendar(_ delegate: CalendarDelegate?) {
        viewController?.setViewControllers([CalendarRouter.createModule(delegate)], animated: true)
    }
}
