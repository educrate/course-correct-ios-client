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
protocol MainWireframeProtocol: CalendarDelegate {
    func presentOnboarding()
    func presentCalendar()
}

// MARK: - Presenter
protocol MainPresenterProtocol: class {}

// MARK: - Interactor
protocol MainInteractorProtocol: class {
    var presenter: MainPresenterProtocol?  { get set }
}
