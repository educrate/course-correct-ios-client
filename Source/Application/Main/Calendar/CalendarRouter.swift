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
}

extension CalendarRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .calendar)
        let view: CalendarViewController = storyboard.instantiateViewController()
        let interactor = CalendarInteractor()
        let router = CalendarRouter()
        let presenter = CalendarPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension CalendarRouter {
    func presentEvent() {
        if let view = viewController, let navigationController = view.navigationController {
            navigationController.pushViewController(EventRouter.createModule(), animated: true)
        }
    }
    
    func presentCreateEvent() {
        if let view = viewController, let navigationController = view.navigationController {
            navigationController.pushViewController(CreateEventRouter.createModule(), animated: true)
        }
    }
    
    func presentProfile() {
        if let view = viewController, let navigationController = view.navigationController {
            navigationController.pushViewController(ProfileOverviewRouter.createModule(), animated: true)
        }
    }
}