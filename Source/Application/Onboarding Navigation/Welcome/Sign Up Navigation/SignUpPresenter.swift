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
    weak private var view: SignUpViewProtocol?
    var interactor: SignUpInteractorProtocol?
    private let router: SignUpWireframeProtocol

    init(interface: SignUpViewProtocol,
         interactor: SignUpInteractorProtocol?,
         router: SignUpWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension SignUpPresenter {
    func start() {
        router.showSelectCollege()
    }
}
