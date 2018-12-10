//
//  OnboardingProtocols.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe
protocol OnboardingWireframeProtocol: WalkthroughRouterDelegate, WelcomeRouterDelegate, CongratulationsRouterDelegate {
    func presentWalkthrough()
    func presentWelcome()
    func presentCongratulations()
}


// MARK: - Coordinator
protocol OnboardingRouterDelegate: class {
    func onboarding(didFinishWith user: String)
}


// MARK: - Presenter
protocol OnboardingPresenterProtocol: class {}


// MARK: - Interactor
protocol OnboardingInteractorProtocol: class {
  var presenter: OnboardingPresenterProtocol?  { get set }
}
