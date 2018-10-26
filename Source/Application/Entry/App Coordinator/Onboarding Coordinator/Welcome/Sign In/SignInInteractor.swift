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
        if email == "campe@uci.edu", password == "AmpeC749" {
            presenter?.credentialsValidated(Result(value: ()))
        } else {
            presenter?.credentialsValidated(Result(error: .invalidCredentials))
        }
    }
}
