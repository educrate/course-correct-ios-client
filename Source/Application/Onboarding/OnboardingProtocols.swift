//
//  OnboardingProtocols.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol OnboardingWireframeProtocol: class, Wireframe {}


// MARK: - Presenter

protocol OnboardingPresenterProtocol: Coordinator, WalkthroughViewControllerDelegate, WelcomeViewControllerDelegate, SignUpPresenterDelegate, SignInViewControllerDelegate, CongratulationsViewControllerDelegate {}


// MARK: - Interactor

protocol OnboardingInteractorProtocol: class {
  var presenter: OnboardingPresenterProtocol?  { get set }
}


// MARK: - View 

protocol OnboardingViewProtocol: class {
  var presenter: OnboardingPresenterProtocol?  { get set }
}
