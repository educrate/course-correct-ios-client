//
//  CreatePasswordPresenter.swift
//  Client
//
//  Created Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreatePasswordPresenter: CreatePasswordPresenterProtocol {
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
    func passwordsEntered(with password: String, reenteredPassword: String) {
        interactor?.validate(password, reenteredPassword: reenteredPassword)
    }
    
    func passwordsValidated(for password: String, reenteredPassword: String, with result: Result<Void, CreatePasswordError>) {
        switch result {
        case .success:
            router.presentCalendar()
        case .failure(let error):
            view?.show(error: error)
        }
    }
}
