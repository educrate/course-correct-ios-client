//
//  WelcomePresenter.swift
//  Client
//
//  Created Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class WelcomePresenter: WelcomePresenterProtocol {
    
    weak private var view: WelcomeViewProtocol?
    var interactor: WelcomeInteractorProtocol?
    private let router: WelcomeWireframeProtocol

    init(interface: WelcomeViewProtocol,
         interactor: WelcomeInteractorProtocol?,
         router: WelcomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension WelcomePresenter {
    func showSelectCollege() {
        router.presentSelectCollege()
    }
}
