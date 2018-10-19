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
        presenter?.passwordsValidated(Result(value: ()))
    }
}
