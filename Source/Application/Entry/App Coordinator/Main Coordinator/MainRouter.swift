//
//  MainRouter.swift
//  Client
//
//  Created Ampe on 10/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class MainRouter: MainWireframeProtocol {
    private weak var viewController: UINavigationController?
    private weak var delegate: MainRouterDelegate?
}

extension MainRouter {
    func presentOnboarding() {
        delegate?.main(didSignOut: "user signed out")
    }
    
    func presentCalendar() {
        viewController?.setViewControllers([CalendarRouter.createModule(self)], animated: true)
    }
}

extension MainRouter {
    func calendarRouter(_ calendarRouter: CalendarRouter, didSignOut user: String) {
        presentOnboarding()
    }
}

extension MainRouter {
    static func createModule(_ delegate: MainRouterDelegate?, with navigationController: UINavigationController?) -> MainPresenter {
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interactor: interactor, router: router)
        
        interactor.presenter = presenter
        router.delegate = delegate
        router.viewController = navigationController
        
        return presenter
    }
}
