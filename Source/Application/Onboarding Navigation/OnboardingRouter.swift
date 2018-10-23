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
        
    }
    
    func presentWelcome() {
        
    }
    
    func presentCongratulations() {
        
    }
}

extension OnboardingRouter {
    func walkthroughRouter(_ walkthroughRouter: WalkthroughRouter, didCompleteWith state: String) {
        
    }
    
    func welcomeRouter(_ welcomeRouter: WelcomeRouter, didSelect option: String) {
        
    }
    
    func signUpRouter(_ signUpRouter: SignUpRouter, didSignUp user: String) {
        
    }
    
    func signInRouter(_ signInRouter: SignInRouter, didSignIn user: String) {
        
    }
    
    func congratulationsRouter(_ congratulationsRouter: CongratulationsRouter, didDisplayWith state: String) {
        
    }
}
