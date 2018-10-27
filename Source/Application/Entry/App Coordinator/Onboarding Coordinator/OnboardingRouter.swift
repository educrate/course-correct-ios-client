//
//  OnboardingRouter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class OnboardingRouter: OnboardingWireframeProtocol {
    private weak var viewController: UINavigationController?
    private weak var delegate: OnboardingRouterDelegate?
}

extension OnboardingRouter {
    func presentWalkthrough() {
        viewController?.setViewControllers([WalkthroughRouter.createModule(self)], animated: true)
    }
    
    func presentWelcome() {
        viewController?.setViewControllers([WelcomeRouter.createModule(self)], animated: true)
    }
    
    func presentCongratulations() {
        viewController?.setViewControllers([CongratulationsRouter.createModule(self)], animated: true)
    }
}

extension OnboardingRouter {
    func walkthrough(didCompleteWith action: String) {
        presentWelcome()
    }
    
    func welcome(didSignUp user: String) {
        presentCongratulations()
    }
    
    func welcome(didSignIn user: String) {
        delegate?.onboarding(didFinishWith: user)
    }
    
    func congratulations(didDisplayWith state: String) {
        delegate?.onboarding(didFinishWith: "congratulations completed")
    }
}

extension OnboardingRouter {
    static func createModule(_ delegate: OnboardingRouterDelegate?, with navigationController: UINavigationController?) -> OnboardingPresenter {
        let interactor = OnboardingInteractor()
        let router = OnboardingRouter()
        let presenter = OnboardingPresenter(interactor: interactor, router: router)
        
        interactor.presenter = presenter
        router.delegate = delegate
        router.viewController = navigationController
        
        return presenter
    }
}
