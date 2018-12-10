//
//  SignInInteractor.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignInInteractor: SignInInteractorProtocol {
    weak var presenter: SignInPresenterProtocol?
}

extension SignInInteractor {
    func validate(email: String, password: String) {
        guard !email.isEmpty else {
            presenter?.credentialsValidated(Result(error: .emptyEmail))
            return
        }
        
        guard !password.isEmpty else {
            presenter?.credentialsValidated(Result(error: .emptyPassword))
            return
        }
        
        guard email == "test", password == "test" else {
            presenter?.credentialsValidated(Result(error: .invalidCredentials))
            return
        }
        
        presenter?.credentialsValidated(Result(value: ()))
    }
}
