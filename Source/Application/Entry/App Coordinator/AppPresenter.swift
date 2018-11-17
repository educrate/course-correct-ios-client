//
//  AppPresenter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppPresenter: AppPresenterProtocol {
    
    // MARK: Viper
    var interactor: AppInteractorProtocol?
    private let router: AppWireframeProtocol

    init(interactor: AppInteractorProtocol?,
         router: AppWireframeProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension AppPresenter {
    func start() {
        interactor?.determineLaunchState()
    }
}

extension AppPresenter {
    func launchStateDetermined(_ state: AppUserState) {
        router.presentOnboardingModule()
    }
}

extension AppPresenter {
    func onboardingPresenter(_ onboardingPresenter: OnboardingPresenter, didFinishWith state: AppUserState) {
        switch state {
        case .authenticated:
            router.presentMainModule()
        case .unauthenticated:
            router.presentOnboardingModule()
        }
    }
    
    func mainPresenter(_ mainPresenter: MainPresenter, didSignOut user: String) {
        router.presentOnboardingModule()
    }
}
