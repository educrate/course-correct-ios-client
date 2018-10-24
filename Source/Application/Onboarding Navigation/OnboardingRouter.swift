//
//  OnboardingRouter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class OnboardingRouter: OnboardingWireframeProtocol {
    weak var viewController: UINavigationController?
    weak var delegate: OnboardingRouterDelegate?
}

extension OnboardingRouter {
    static func createModule(_ delegate: OnboardingRouterDelegate?) -> UINavigationController {
        let storyboard = UIStoryboard(storyboard: .onboarding)
        let view: OnboardingViewController = storyboard.instantiateViewController()
        let interactor = OnboardingInteractor()
        let router = OnboardingRouter()
        let presenter = OnboardingPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}

extension OnboardingRouter {
    func presentWalkthrough() {
        viewController?.setViewControllers([WalkthroughRouter.createModule(self)], animated: true)
    }
    
    func presentWelcome() {
        viewController?.setViewControllers([WelcomeRouter.createModule(self)], animated: true)
    }
    
    func presentCongratulations() {
        viewController?.setViewControllers([WelcomeRouter.createModule(self)], animated: true)
    }
}

extension OnboardingRouter {
    func walkthroughRouter(_ walkthroughRouter: WalkthroughRouter, didCompleteWith state: String) {
        presentWelcome()
    }
    
    func welcomeRouter(_ welcomeRouter: WelcomeRouter, didCompleteWith user: String) {
        presentCongratulations()
    }
    
    func congratulationsRouter(_ congratulationsRouter: CongratulationsRouter, didDisplayWith state: String) {
        delegate?.onboardingRouter(self, didFinishWith: "congratulations screen handled")
    }
}
