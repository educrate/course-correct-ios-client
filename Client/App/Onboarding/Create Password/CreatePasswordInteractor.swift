//
//  CreatePasswordInteractor.swift
//  Client
//
//  Created Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreatePasswordInteractor: CreatePasswordInteractorProtocol {
    weak var presenter: CreatePasswordPresenterProtocol?
}

extension CreatePasswordInteractor {
    func validate(_ password: String, reenteredPassword: String) {
        if password != reenteredPassword {
            presenter?.passwordsValidated(for: password, reenteredPassword: reenteredPassword, with: Result(error: .passwordsDoNotMatch))
        }
    }
}
