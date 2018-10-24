//
//  AppRouter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppRouter: AppWireframeProtocol {
    private weak var window: UIWindow?
}

extension AppRouter {
    func presentOnboardingModule() {
        window?.rootViewController = OnboardingRouter.createModule(self)
        window?.makeKeyAndVisible()
    }
    
    func presentMainModule() {
        window?.rootViewController = MainRouter.createModule(self)
        window?.makeKeyAndVisible()
    }
}

extension AppRouter {
    func onboardingRouter(_ onboardingRouter: OnboardingRouter, didFinishWith state: String) {
        presentMainModule()
    }
    
    func mainRouter(_ mainRouter: MainRouter, didSignOut user: String) {
        presentOnboardingModule()
    }
}

extension AppRouter {
    static func createModule(_ window: UIWindow?) -> AppPresenterProtocol? {
        guard let view = window else {
            assertionFailure("there must be a root window set")
            return nil
        }
        
        let interactor = AppInteractor()
        let router = AppRouter()
        let presenter = AppPresenter(interactor: interactor, router: router)
        
        interactor.presenter = presenter
        router.window = view
        
        return presenter
    }
}
