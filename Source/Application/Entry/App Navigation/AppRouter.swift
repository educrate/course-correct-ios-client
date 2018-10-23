//
//  AppRouter.swift
//  Client
//
//  Created Ampe on 10/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppRouter: AppWireframeProtocol {
    weak var navigationController: UINavigationController?
}

extension AppRouter {
    static func createModule(_ view: AppViewProtocol) -> AppPresenterProtocol? {
        guard let navigationController = view as? UINavigationController else {
            assertionFailure("base view must be of type UINavigationController")
            return nil
        }
        
        let interactor = AppInteractor()
        let router = AppRouter()
        let presenter = AppPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.navigationController = navigationController
        
        return presenter
    }
}

extension AppRouter {
    func presentOnboarding() {
        navigationController?.setViewControllers([OnboardingRouter.createModule()], animated: true)
    }
    
    func presentSchedule() {
        navigationController?.setViewControllers([CalendarRouter.createModule()], animated: true)
    }
}
