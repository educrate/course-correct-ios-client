//
//  SignInPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignInPresenter: SignInPresenterProtocol {
    var interactor: SignInInteractorProtocol?
    var router: SignInWireframeProtocol?
    weak var view: SignInViewProtocol?
    weak var delegate: SignInDelegate?
}

extension SignInPresenter {
    func credentialsEntered(email: String, password: String) {
        interactor?.validate(email: email, password: password)
    }
    
    func credentialsValidated(_ result: Result<Void, SignInError>) {
        switch result {
        case .success:
            delegate?.signIn(didSignIn: "user")
        case .failure(let error):
            view?.show(errorMessage: error.message)
        }
    }
}
