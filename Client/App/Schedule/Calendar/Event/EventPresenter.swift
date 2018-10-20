//
//  EventPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EventPresenter: EventPresenterProtocol {
    weak private var view: EventViewProtocol?
    var interactor: EventInteractorProtocol?
    private let router: EventWireframeProtocol

    init(interface: EventViewProtocol,
         interactor: EventInteractorProtocol?,
         router: EventWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
