//
//  CalendarProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol CalendarDelegate: class {
    func calendarRouter(_ calendarRouter: CalendarRouter, didSignOut user: String)
}

// MARK: - Wireframe
protocol CalendarWireframeProtocol: ProfileOverviewDelegate {
    func presentEvent()
    func presentCreateEvent(_ delegate: CreateEventDelegate?)
    func presentProfile()
    func unwind()
}

// MARK: - Presenter
protocol CalendarPresenterProtocol: class {
    
    // MARK: Navigation Events
    func showEvent()
    func showCreateEvent(_ delegate: CreateEventDelegate?)
    func showProfile()
    func eventCreated()
}


// MARK: - Interactor
protocol CalendarInteractorProtocol: class {
  var presenter: CalendarPresenterProtocol? { get set }
}


// MARK: - View
protocol CalendarViewProtocol: CreateEventDelegate {
  var presenter: CalendarPresenterProtocol? { get set }
}
