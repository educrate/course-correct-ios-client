//
//  CalendarPresenter.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CalendarPresenter: CalendarPresenterProtocol {

    weak private var view: CalendarViewProtocol?
    var interactor: CalendarInteractorProtocol?
    private let router: CalendarWireframeProtocol

    init(interface: CalendarViewProtocol, interactor: CalendarInteractorProtocol?, router: CalendarWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
