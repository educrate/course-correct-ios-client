//
//  AppRouter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppRouter: AppWireframeProtocol {
    private weak var viewController: UINavigationController?
    private lazy var onboardingCoordinator: OnboardingPresenter = OnboardingRouter.createModule(self, with: viewController)
    private lazy var mainCoordinator: MainPresenter = MainRouter.createModule(self, with: viewController)
}

extension AppRouter {
    func presentOnboardingModule() {
        onboardingCoordinator.start()
    }
    
    func presentMainModule() {
        mainCoordinator.start()
    }
}

extension AppRouter {
    func onboarding(didFinishWith user: String) {
        presentMainModule()
    }
    
    func main(didSignOut user: String) {
        presentOnboardingModule()
    }
}

extension AppRouter {
    static func createModule(with navigationController: UINavigationController?) -> AppPresenter? {
        let interactor = AppInteractor()
        let router = AppRouter()
        let presenter = AppPresenter(interactor: interactor, router: router)
        
        interactor.presenter = presenter
        router.viewController = navigationController
        
        return presenter
    }
}
