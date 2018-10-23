//
//  OnboardingPresenter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

protocol OnboardingPresenterDelegate: class {
    func onboardingPresenter(_ onboardingPresenter: OnboardingPresenter, didFinishWith state: String)
}

class OnboardingPresenter: OnboardingPresenterProtocol {
    weak private var view: OnboardingViewProtocol?
    var interactor: OnboardingInteractorProtocol?
    private let router: OnboardingWireframeProtocol

    init(interface: OnboardingViewProtocol,
         interactor: OnboardingInteractorProtocol?,
         router: OnboardingWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension OnboardingPresenter {
    func start() {
        
    }
}

extension OnboardingPresenter {
    func walkthroughViewController(_ walkthroughViewController: WalkthroughViewController, didCompleteWith state: String) {
        
    }
    
    func welcomeViewController(_ welcomeViewController: WelcomeViewController, didSelect option: String) {
        
    }
    
    func signUpPresenter(_ signUpPresenter: SignUpPresenter, didSignUp user: String) {
        
    }
    
    func signInViewController(_ signInViewController: SignInViewController, didSignIn user: String) {
        
    }
    
    func congratulationsViewController(_ congratulationsViewController: CongratulationsViewController, didDisplayWith state: String) {
        
    }
}
