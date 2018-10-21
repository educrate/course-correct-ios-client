//
//  AppProtocols.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol AppWireframeProtocol: class {
    func routeToOnboarding()
    func routeIntoApplication()
}


// MARK: - Presenter

protocol AppPresenterProtocol: class {
    func start()
}


// MARK: - Interactor

protocol AppInteractorProtocol: class {
  var presenter: AppPresenterProtocol?  { get set }
    
    func checkUserStatus()
}
