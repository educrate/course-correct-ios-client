//
//  CreateEventProtocols.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol CreateEventDelegate: class {
    func didCreateEvent(_ event: Any)
}

// MARK: - Wireframe
protocol CreateEventWireframeProtocol: class {
    func showAddLocation(_ delegate: AddLocationDelegate?)
    func showSelectTutor(_ delegate: TutorListDelegate?)
    
    func unwind()
}

// MARK: - Presenter
protocol CreateEventPresenterProtocol: class {
    func pressedAddLocation(_ delegate: AddLocationDelegate?)
    func pressedSelectTutor(_ delegate: TutorListDelegate?)
    
    func locationAdded()
    func tutorSelected()
}

// MARK: - Interactor
protocol CreateEventInteractorProtocol: class {
  var presenter: CreateEventPresenterProtocol?  { get set }
}

// MARK: - View
protocol CreateEventViewProtocol: AddLocationDelegate, TutorListDelegate {
  var presenter: CreateEventPresenterProtocol?  { get set }
}
