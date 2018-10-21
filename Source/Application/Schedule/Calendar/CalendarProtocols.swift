//
//  CalendarProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol CalendarWireframeProtocol: class, ModuleWireframeable {
    func presentEvent()
    func presentCreateEvent()
    func presentProfile()
}


// MARK: - Presenter

protocol CalendarPresenterProtocol: class {
    
    // MARK: Navigation Events
    func showEvent()
    func createEvent()
    func showProfile()
}


// MARK: - Interactor

protocol CalendarInteractorProtocol: class {
  var presenter: CalendarPresenterProtocol? { get set }
}


// MARK: - View 

protocol CalendarViewProtocol: class {
  var presenter: CalendarPresenterProtocol? { get set }
}
