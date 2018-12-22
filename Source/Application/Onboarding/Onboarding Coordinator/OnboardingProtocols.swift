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
protocol OnboardingWireframeProtocol: class {
    func presentWalkthrough(_ delegate: WalkthroughDelegate?)
    func presentWelcome(_ delegate: WelcomeDelegate?)
    func presentCongratulations(_ delegate: CongratulationsDelegate?)
}

// MARK: - Presenter
protocol OnboardingPresenterProtocol: WalkthroughDelegate, WelcomeDelegate, CongratulationsDelegate {
    var router: OnboardingWireframeProtocol? { get set }
    var interactor: OnboardingInteractorProtocol? { get set }
}

// MARK: - Interactor
protocol OnboardingInteractorProtocol: class {
  var presenter: OnboardingPresenterProtocol?  { get set }
}
