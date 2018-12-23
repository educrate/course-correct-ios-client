//
//  MainPresenter.swift
//  Client
//
//  Created Ampe on 10/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class MainPresenter: MainPresenterProtocol {
    var interactor: MainInteractorProtocol?
    var router: MainWireframeProtocol?
    weak var delegate: MainDelegate?
}

extension MainPresenter {
    func start() {
        router?.presentCalendar(self)
    }
}

extension MainPresenter {
    func calendarRouter(_ calendarRouter: CalendarRouter, didSignOut user: String) {
        delegate?.main(didSignOut: user)
    }
}
