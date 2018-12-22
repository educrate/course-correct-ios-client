//
//  WelcomePresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class WelcomePresenter: WelcomePresenterProtocol {
    var interactor: WelcomeInteractorProtocol?
    var router: WelcomeWireframeProtocol?
    weak var view: WelcomeViewProtocol?
    weak var delegate: WelcomeDelegate?
}

extension WelcomePresenter {
    func signUp(didSignUp user: String) {
        delegate?.welcome(didSignUp: user)
    }
    
    func signIn(didSignIn user: String) {
        delegate?.welcome(didSignIn: user)
    }
}

extension WelcomePresenter {
    func showSignUp() {
        router?.presentSignUp(self)
    }
    
    func showSignIn() {
        router?.presentSignIn(self)
    }
}
