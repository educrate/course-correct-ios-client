//
//  AppRouter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppRouter: AppWireframeProtocol {
    weak var viewController: UIViewController?
}

extension AppRouter {
    func presentOnboardingModule(_ delegate: OnboardingPresenterDelegate?) {
        viewController?.present(OnboardingRouter.createModule(delegate), animated: true)
    }
    
    func presentMainModule() {
        viewController?.present(MainRouter.createModule(), animated: true)
    }
}

extension AppRouter {
    static func createModule(_ view: AppViewProtocol) -> AppPresenterProtocol? {
        let interactor = AppInteractor()
        let router = AppRouter()
        let presenter = AppPresenter(interface: view, interactor: interactor, router: router)
        
        guard let viewController = view as? UIViewController else {
            assertionFailure("view must be of type UIViewController")
            return nil
        }
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        
        return presenter
    }
}
