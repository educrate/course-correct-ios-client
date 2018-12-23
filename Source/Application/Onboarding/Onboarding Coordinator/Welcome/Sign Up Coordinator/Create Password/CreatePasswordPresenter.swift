//
//  CreatePasswordPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreatePasswordPresenter: CreatePasswordPresenterProtocol {
    var interactor: CreatePasswordInteractorProtocol?
    var router: CreatePasswordWireframeProtocol?
    weak var view: CreatePasswordViewProtocol?
    weak var delegate: CreatePasswordDelegate?
}

extension CreatePasswordPresenter {
    func entered(password: String, confirmedPassword: String) {
        interactor?.validate(password, confirmedPassword: confirmedPassword)
    }
    
    func passwordsValidated(_ result: Result<Void, CreatePasswordError>) {
        switch result {
        case .success:
            delegate?.createPassword(didCreate: "password")
        case .failure(let error):
            view?.show(errorMessage: error.message)
        }
    }
}
