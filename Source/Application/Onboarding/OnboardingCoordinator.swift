//
//  OnboardingCoordinator.swift
//  Client
//
//  Created by Ampe on 10/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

protocol OnboardingCoordinatorDelegate: class {
    func onboardingCoordinator(_ onboardingCoordinator: OnboardingCoordinator, didFinishWith state: String)
}

class OnboardingCoordinator {
    private weak var delegate: OnboardingCoordinatorDelegate?
}

extension OnboardingCoordinator: Coordinator {
    func start() {
        
    }
}

extension OnboardingCoordinator: WalkthroughViewControllerDelegate {
    func walkthroughViewController(_ walkthroughViewController: WalkthroughViewController, didCompleteWith state: String) {
        
    }
}

extension OnboardingCoordinator: WelcomeViewControllerDelegate {
    func welcomeViewController(_ welcomeViewController: WelcomeViewController, didSelect option: String) {
        
    }
}

extension OnboardingCoordinator: SignUpCoordinatorDelegate {
    func signUpCoordinator(_ signUpCoordinator: SignUpCoordinator, didSignUp user: String) {
        
    }
}

extension OnboardingCoordinator: SignInViewControllerDelegate {
    func signInViewController(_ signInViewController: SignInViewController, didSignIn user: String) {
        
    }
}

extension OnboardingCoordinator: CongratulationsViewControllerDelegate {
    func congratulationsViewController(_ congratulationsViewController: CongratulationsViewController, didDisplayWith state: String) {
        
    }
}
