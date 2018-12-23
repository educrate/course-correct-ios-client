//
//  MainProtocols.swift
//  Client
//
//  Created Ampe on 10/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol MainDelegate: class {
    func main(didSignOut user: String)
}

// MARK: - Wireframe
protocol MainWireframeProtocol: class {
    func presentCalendar(_ delegate: CalendarDelegate?)
}

// MARK: - Presenter
protocol MainPresenterProtocol: CalendarDelegate {
    var router: MainWireframeProtocol? { get set }
    var interactor: MainInteractorProtocol? { get set }
    var delegate: MainDelegate? { get set }
}

// MARK: - Interactor
protocol MainInteractorProtocol: class {
    var presenter: MainPresenterProtocol?  { get set }
}
