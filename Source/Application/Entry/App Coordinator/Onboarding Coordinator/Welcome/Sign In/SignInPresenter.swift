//
//  SignInPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignInPresenter: SignInPresenterProtocol {
    
    // MARK: Viper
    weak private var view: SignInViewProtocol?
    var interactor: SignInInteractorProtocol?
    private let router: SignInWireframeProtocol

    init(interface: SignInViewProtocol,
         interactor: SignInInteractorProtocol?,
         router: SignInWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension SignInPresenter {
    func credentialsEntered(email: String, password: String) {
        interactor?.validate(email: email, password: password)
    }
    
    func credentialsValidated(_ result: Result<Void, SignInError>) {
        switch result {
        case .success:
            router.showNextScreen()
        case .failure(let error):
            view?.show(error: error)
        }
    }
}
