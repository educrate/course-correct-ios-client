//
//  CreatePasswordPresenter.swift
//  Client
//
//  Created Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreatePasswordPresenter: CreatePasswordPresenterProtocol {

    weak private var view: CreatePasswordViewProtocol?
    var interactor: CreatePasswordInteractorProtocol?
    private let router: CreatePasswordWireframeProtocol

    init(interface: CreatePasswordViewProtocol, interactor: CreatePasswordInteractorProtocol?, router: CreatePasswordWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
