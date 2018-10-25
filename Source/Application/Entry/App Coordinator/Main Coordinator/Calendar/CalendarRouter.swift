//
//  CalendarRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CalendarRouter: CalendarWireframeProtocol {
    private weak var viewController: UIViewController?
    private weak var delegate: CalendarRouterDelegate?
}

extension CalendarRouter {
    func presentEvent() {
        viewController?.show(EventRouter.createModule(), sender: nil)
    }
    
    func presentCreateEvent() {
        viewController?.show(CreateEventRouter.createModule(), sender: nil)
    }
    
    func presentProfile() {
        viewController?.show(ProfileOverviewRouter.createModule(self), sender: nil)
    }
}

extension CalendarRouter {
    func profileOverviewRouter(_ profileOverviewRouter: ProfileOverviewRouter, didSignOut user: String) {
        delegate?.calendarRouter(self, didSignOut: "user signed out")
    }
}

extension CalendarRouter {
    static func createModule(_ delegate: CalendarRouterDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .calendar)
        let view: CalendarViewController = storyboard.instantiateViewController()
        let interactor = CalendarInteractor()
        let router = CalendarRouter()
        let presenter = CalendarPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}
