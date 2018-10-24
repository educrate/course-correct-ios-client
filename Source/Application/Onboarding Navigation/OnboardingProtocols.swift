//
//  OnboardingProtocols.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol OnboardingWireframeProtocol: WalkthroughViewControllerDelegate, WelcomeViewControllerDelegate, CongratulationsViewControllerDelegate {
    func presentWalkthrough()
    func presentWelcome()
    func presentCongratulations()
}


// MARK: - Presenter

protocol OnboardingPresenterProtocol: class, Coordinator {}


// MARK: - Interactor

protocol OnboardingInteractorProtocol: class {
  var presenter: OnboardingPresenterProtocol?  { get set }
}


// MARK: - View 

protocol OnboardingViewProtocol: class {
  var presenter: OnboardingPresenterProtocol?  { get set }
}
