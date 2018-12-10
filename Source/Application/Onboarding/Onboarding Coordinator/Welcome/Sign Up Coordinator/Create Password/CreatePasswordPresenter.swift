//
//  CreatePasswordPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreatePasswordPresenter: CreatePasswordPresenterProtocol {
    
    // MARK: Viper
    weak private var view: CreatePasswordViewProtocol?
    var interactor: CreatePasswordInteractorProtocol?
    private let router: CreatePasswordWireframeProtocol

    init(interface: CreatePasswordViewProtocol,
         interactor: CreatePasswordInteractorProtocol?,
         router: CreatePasswordWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension CreatePasswordPresenter {
    func entered(password: String, confirmedPassword: String) {
        interactor?.validate(password, confirmedPassword: confirmedPassword)
    }
    
    func passwordsValidated(_ result: Result<Void, CreatePasswordError>) {
        switch result {
        case .success:
            router.showNextScreen()
        case .failure(let error):
            view?.show(errorMessage: error.message)
        }
    }
}
