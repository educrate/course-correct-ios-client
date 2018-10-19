//
//  NewEventPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class NewEventPresenter: NewEventPresenterProtocol {

    weak private var view: NewEventViewProtocol?
    var interactor: NewEventInteractorProtocol?
    private let router: NewEventWireframeProtocol

    init(interface: NewEventViewProtocol,
         interactor: NewEventInteractorProtocol?,
         router: NewEventWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
