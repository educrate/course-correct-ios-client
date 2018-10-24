//
//  OnboardingRouter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class OnboardingRouter: OnboardingWireframeProtocol {
    weak var viewController: UIViewController?
    weak var delegate: OnboardingRouterDelegate?
}

extension OnboardingRouter {
    static func createModule(_ delegate: OnboardingRouterDelegate?) -> UIViewController {
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
        viewController?.present(WalkthroughRouter.createModule(self), animated: true)
    }
    
    func presentWelcome() {
        viewController?.present(WelcomeRouter.createModule(self), animated: true)
    }
    
    func presentCongratulations() {
        viewController?.present(CongratulationsRouter.createModule(self), animated: true)
    }
}

extension OnboardingRouter {
    func walkthroughRouter(_ walkthroughRouter: WalkthroughRouter, didCompleteWith state: String) {
        
    }
    
    func welcomeRouter(_ welcomeRouter: WelcomeRouter, didSelect option: String) {
        
    }
    
    func congratulationsRouter(_ congratulationsRouter: CongratulationsRouter, didDisplayWith state: String) {
        
    }
}
