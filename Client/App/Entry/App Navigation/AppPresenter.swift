//
//  AppPresenter.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppPresenter: AppPresenterProtocol {
    var interactor: AppInteractorProtocol?
    private let router: AppWireframeProtocol

    init(interactor: AppInteractorProtocol?,
         router: AppWireframeProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension AppPresenter {
    func start() {
        interactor?.checkUserStatus()
    }
}
