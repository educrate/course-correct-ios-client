//
//  OnboardingProtocols.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol OnboardingDelegate: class {
    func onboarding(didFinishWith user: String)
}

// MARK: - Wireframe
protocol OnboardingWireframeProtocol: WalkthroughDelegate, WelcomeDelegate, CongratulationsDelegate {
    func presentWalkthrough()
    func presentWelcome()
    func presentCongratulations()
}

// MARK: - Presenter
protocol OnboardingPresenterProtocol: class {}

// MARK: - Interactor
protocol OnboardingInteractorProtocol: class {
  var presenter: OnboardingPresenterProtocol?  { get set }
}
