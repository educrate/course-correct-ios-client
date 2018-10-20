//
//  ProfileAccountPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileAccountPresenter: ProfileAccountPresenterProtocol {

    weak private var view: ProfileAccountViewProtocol?
    var interactor: ProfileAccountInteractorProtocol?
    private let router: ProfileAccountWireframeProtocol

    init(interface: ProfileAccountViewProtocol,
         interactor: ProfileAccountInteractorProtocol?,
         router: ProfileAccountWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
