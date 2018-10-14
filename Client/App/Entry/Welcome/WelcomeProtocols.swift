//
//  WelcomeProtocols.swift
//  Client
//
//  Created Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol WelcomeWireframeProtocol: class, ModuleWireframeable {
    func presentSelectCollege()
}


// MARK: - Presenter

protocol WelcomePresenterProtocol: class {
    func showSelectCollege()
}


// MARK: - Interactor

protocol WelcomeInteractorProtocol: class {
  var presenter: WelcomePresenterProtocol?  { get set }
}


// MARK: - View 

protocol WelcomeViewProtocol: class {
  var presenter: WelcomePresenterProtocol?  { get set }
}
