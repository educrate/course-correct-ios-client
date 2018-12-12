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
    func didSelect(_ location: Any)
}

// MARK: - Wireframe
protocol CreateEventWireframeProtocol: SelectTutorDelegate {
    func showAddLocation()
    func showSelectTutor()
}

// MARK: - Presenter
protocol CreateEventPresenterProtocol: class {
    func pressedAddLocation()
    func pressedSelectTutor()
}

// MARK: - Interactor
protocol CreateEventInteractorProtocol: class {
  var presenter: CreateEventPresenterProtocol?  { get set }
}

// MARK: - View
protocol CreateEventViewProtocol: class {
  var presenter: CreateEventPresenterProtocol?  { get set }
}
