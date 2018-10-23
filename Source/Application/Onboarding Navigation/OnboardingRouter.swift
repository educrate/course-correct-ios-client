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
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .onboarding)
        let view: OnboardingViewController = storyboard.instantiateViewController()
        let interactor = OnboardingInteractor()
        let router = OnboardingRouter()
        let presenter = OnboardingPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension OnboardingRouter {
    func presentWalkthrough() {
        viewController?.present(WalkthroughRouter.createModule(), animated: true)
    }
    
    func presentWelcome() {
        viewController?.present(WelcomeRouter.createModule(), animated: true)
    }
    
    func presentCongratulations() {
        viewController?.present(CongratulationsRouter.createModule(), animated: true)
    }
}
