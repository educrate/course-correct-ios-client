//
//  AppPresenter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppPresenter: AppPresenterProtocol {
    weak private var view: AppViewProtocol?
    var interactor: AppInteractorProtocol?
    private let router: AppWireframeProtocol

    init(interface: AppViewProtocol,
         interactor: AppInteractorProtocol?,
         router: AppWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension AppPresenter {
    func start() {
        
    }
}

extension AppPresenter {
    func onboardingPresenter(_ onboardingPresenter: OnboardingPresenter, didFinishWith state: String) {
        
    }
    
    func mainPresenter(_ mainPresenter: MainPresenter, didSignOut user: String) {
        
    }
}