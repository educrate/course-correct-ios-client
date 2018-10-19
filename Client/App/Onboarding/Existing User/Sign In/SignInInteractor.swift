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
        presenter?.credentialsValidated(Result(value: ()))
    }
}
