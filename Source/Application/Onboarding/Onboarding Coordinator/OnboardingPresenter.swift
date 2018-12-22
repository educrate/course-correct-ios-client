//
//  OnboardingPresenter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class OnboardingPresenter: OnboardingPresenterProtocol {
    var router: OnboardingWireframeProtocol?
    var interactor: OnboardingInteractorProtocol?
    weak var delegate: OnboardingDelegate?
}

extension OnboardingPresenter {
    func start() {
        router?.presentWelcome(self)
    }
}

extension OnboardingPresenter {
    func walkthrough(didCompleteWith action: String) {
        router?.presentWelcome(self)
    }
    
    func welcome(didSignUp user: String) {
        router?.presentCongratulations(self)
    }
    
    func welcome(didSignIn user: String) {
        delegate?.onboarding(didFinishWith: user)
    }
    
    func congratulations(didDisplayWith state: String) {
        delegate?.onboarding(didFinishWith: "congratulations completed")
    }
}
