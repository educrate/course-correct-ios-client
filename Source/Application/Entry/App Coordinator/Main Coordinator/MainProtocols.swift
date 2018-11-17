//
//  MainProtocols.swift
//  Client
//
//  Created Ampe on 10/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe
protocol MainWireframeProtocol: CalendarRouterDelegate {
    func presentOnboarding()
    func presentCalendar()
}


// MARK: - Coordinator
protocol MainRouterDelegate: class {
    func main(didSignOut user: String)
}


// MARK: - Presenter
protocol MainPresenterProtocol: class {}


// MARK: - Interactor
protocol MainInteractorProtocol: class {
    var presenter: MainPresenterProtocol?  { get set }
}
