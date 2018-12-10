//
//  CreatePasswordInteractor.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreatePasswordInteractor: CreatePasswordInteractorProtocol {
    weak var presenter: CreatePasswordPresenterProtocol?
}

extension CreatePasswordInteractor {
    func validate(_ password: String, confirmedPassword: String) {
        guard !password.isEmpty else {
            presenter?.passwordsValidated(Result(error: .emptyPassword))
            return
        }
        
        guard password == confirmedPassword else {
            presenter?.passwordsValidated(Result(error: .passwordsDoNotMatch))
            return
        }
        
        guard password.count >= 6 else {
            presenter?.passwordsValidated(Result(error: .invalidPassword))
            return
        }
        
        presenter?.passwordsValidated(Result(value: ()))
    }
}
