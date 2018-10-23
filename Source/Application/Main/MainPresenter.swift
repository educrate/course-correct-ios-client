//
//  MainPresenter.swift
//  Client
//
//  Created Ampe on 10/23/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

protocol MainPresenterDelegate: class {
    func mainPresenter(_ mainPresenter: MainPresenter, didSignOut user: String)
}

class MainPresenter: MainPresenterProtocol {
    weak private var view: MainViewProtocol?
    var interactor: MainInteractorProtocol?
    private let router: MainWireframeProtocol

    init(interface: MainViewProtocol,
         interactor: MainInteractorProtocol?,
         router: MainWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
