//
//  SignInPresenter.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignInPresenter: SignInPresenterProtocol {

    weak private var view: SignInViewProtocol?
    var interactor: SignInInteractorProtocol?
    private let router: SignInWireframeProtocol

    init(interface: SignInViewProtocol,
         interactor: SignInInteractorProtocol?,
         router: SignInWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
