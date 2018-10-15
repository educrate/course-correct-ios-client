//
//  CreateEventPresenter.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreateEventPresenter: CreateEventPresenterProtocol {

    weak private var view: CreateEventViewProtocol?
    var interactor: CreateEventInteractorProtocol?
    private let router: CreateEventWireframeProtocol

    init(interface: CreateEventViewProtocol, interactor: CreateEventInteractorProtocol?, router: CreateEventWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
