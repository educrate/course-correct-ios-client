//
//  WelcomePresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class WelcomePresenter: WelcomePresenterProtocol {
    
    // MARK: Viper
    weak private var view: WelcomeViewProtocol?
    var interactor: WelcomeInteractorProtocol?
    private let router: WelcomeWireframeProtocol
    
    // MARK: Coordinator
    private weak var coordinator: WelcomeViewControllerDelegate?

    init(interface: WelcomeViewProtocol,
         interactor: WelcomeInteractorProtocol?,
         router: WelcomeWireframeProtocol,
         coordinator: WelcomeViewControllerDelegate?) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.coordinator = coordinator
    }
}

extension WelcomePresenter {
    func showSignUp() {
        router.presentSignUpModule(self)
    }
    
    func showSignIn() {
        router.presentSignIn()
    }
}

extension WelcomePresenter {
    func signUpPresenter(_ signUpPresenter: SignUpPresenter, didSignUp user: String) {
        
    }
}
