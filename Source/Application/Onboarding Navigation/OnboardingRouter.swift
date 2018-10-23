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
}

extension OnboardingRouter {
    static func createModule(_ delegate: OnboardingPresenterDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .onboarding)
        let view: OnboardingViewController = storyboard.instantiateViewController()
        let interactor = OnboardingInteractor()
        let router = OnboardingRouter()
        let presenter = OnboardingPresenter(interface: view, interactor: interactor, router: router, delegate: delegate)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension OnboardingRouter {
    func presentWalkthrough(_ delegate: WalkthroughViewControllerDelegate?) {
        viewController?.present(WalkthroughRouter.createModule(delegate), animated: true)
    }
    
    func presentWelcome(_ delegate: WelcomeViewControllerDelegate?) {
        viewController?.present(WelcomeRouter.createModule(delegate), animated: true)
    }
    
    func presentCongratulations(_ delegate: CongratulationsViewControllerDelegate?) {
        viewController?.present(CongratulationsRouter.createModule(delegate), animated: true)
    }
}
