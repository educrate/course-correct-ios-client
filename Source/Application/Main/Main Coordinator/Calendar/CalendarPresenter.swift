//
//  CalendarPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CalendarPresenter: CalendarPresenterProtocol {
    var interactor: CalendarInteractorProtocol?
    var router: CalendarWireframeProtocol?
    weak var view: CalendarViewProtocol?
    weak var delegate: CalendarDelegate?
}

extension CalendarPresenter {
    func showEvent() {
        router?.presentEvent()
    }
    
    func showCreateEvent(_ delegate: CreateEventDelegate?) {
        router?.presentCreateEvent(delegate)
    }
    
    func showProfile() {
        router?.presentProfile()
    }
    
    func eventCreated() {
        router?.unwind()
    }
}
