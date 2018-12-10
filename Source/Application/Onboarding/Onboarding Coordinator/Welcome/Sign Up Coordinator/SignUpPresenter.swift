//
//  SignUpPresenter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignUpPresenter: SignUpPresenterProtocol {
    
    // MARK: Viper
    var interactor: SignUpInteractorProtocol?
    private let router: SignUpWireframeProtocol

    init(interactor: SignUpInteractorProtocol?,
         router: SignUpWireframeProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension SignUpPresenter {
    func start() {
        router.showSelectCollege()
    }
}
