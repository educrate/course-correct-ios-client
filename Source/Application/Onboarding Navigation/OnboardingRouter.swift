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
    static func createModule(_ delegate: OnboardingViewControllerDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .onboarding)
        let view: OnboardingViewController = storyboard.instantiateViewController()
        let interactor = OnboardingInteractor()
        let router = OnboardingRouter()
        let presenter = OnboardingPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        view.onboardingDelegate = delegate
        interactor.presenter = presenter
        router.viewController = view
        
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
    func walkthroughViewController(_ walkthroughViewController: WalkthroughViewController, didCompleteWith state: String) {
        
    }
    
    func welcomeViewController(_ welcomeViewController: WelcomeViewController, didSelect option: String) {
        
    }
    
    func signUpRouter(_ signUpRouter: SignUpRouter, didSignUp user: String) {
        
    }
    
    func signInRouter(_ signInRouter: SignInRouter, didSignIn user: String) {
        
    }
    
    func congratulationsViewController(_ congratulationsViewController: CongratulationsViewController, didDisplayWith state: String) {
        
    }
}
