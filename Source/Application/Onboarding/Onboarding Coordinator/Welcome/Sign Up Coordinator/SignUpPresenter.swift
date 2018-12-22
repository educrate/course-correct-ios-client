//
//  SignUpPresenter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignUpPresenter: SignUpPresenterProtocol {
    var router: SignUpWireframeProtocol?
    var interactor: SignUpInteractorProtocol?
    weak var delegate: SignUpDelegate?
}

extension SignUpPresenter {
    func start() {
        router?.showSelectCollege(self)
    }
}

extension SignUpPresenter {
    func selectCollege(didSelect college: String) {
        router?.showEnterStudentIdentifier(self)
    }
    
    func enterStudentIdentifier(didEnter studentIdentifier: String) {
        router?.showEnterAccessCode(self)
    }
    
    func enterAccessCode(didEnter accessCode: String) {
        router?.showCreatePassword(self)
    }
    
    func createPassword(didCreate password: String) {
        delegate?.signUp(didSignUp: "user")
    }
}
