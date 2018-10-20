//
//  AddLocationPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AddLocationPresenter: AddLocationPresenterProtocol {
    weak private var view: AddLocationViewProtocol?
    var interactor: AddLocationInteractorProtocol?
    private let router: AddLocationWireframeProtocol

    init(interface: AddLocationViewProtocol,
         interactor: AddLocationInteractorProtocol?,
         router: AddLocationWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
