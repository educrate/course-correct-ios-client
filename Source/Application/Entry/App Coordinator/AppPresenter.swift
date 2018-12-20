//
//  AppPresenter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppPresenter: AppPresenterProtocol {
    var router: AppWireframeProtocol?
    var interactor: AppInteractorProtocol?
    weak var view: AppViewProtocol?
}

extension AppPresenter {
    func start() {
        interactor?.determineLaunchState()
    }
}

extension AppPresenter {
    func launchStateDetermined(_ state: AppUserState) {
        router?.presentOnboarding(self)
    }
}

extension AppPresenter {
    func onboarding(didFinishWith user: String) {
        router?.presentMain(self)
    }
    
    func main(didSignOut user: String) {
        router?.presentOnboarding(self)
    }
}

extension AppPresenter {
    func onboardingPresenter(_ onboardingPresenter: OnboardingPresenter, didFinishWith state: AppUserState) {
        switch state {
        case .authenticated:
            router?.presentMain(self)
        case .unauthenticated:
            router?.presentOnboarding(self)
        }
    }
    
    func mainPresenter(_ mainPresenter: MainPresenter, didSignOut user: String) {
        router?.presentOnboarding(self)
    }
}
