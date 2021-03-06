//
//  CreatePasswordProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol CreatePasswordDelegate: class {
    func createPassword(didCreate password: String)
}

// MARK: - Wireframe
protocol CreatePasswordWireframeProtocol: class {
}

// MARK: - Presenter
protocol CreatePasswordPresenterProtocol: class {
    var router: CreatePasswordWireframeProtocol? { get set }
    var interactor: CreatePasswordInteractorProtocol? { get set }
    var view: CreatePasswordViewProtocol? { get set }
    var delegate: CreatePasswordDelegate? { get set }
    
    func entered(password: String, confirmedPassword: String)
    func passwordsValidated(_ result: Result<Void, CreatePasswordError>)
}

// MARK: - Interactor
protocol CreatePasswordInteractorProtocol: class {
  var presenter: CreatePasswordPresenterProtocol? { get set }
    
    func validate(_ password: String, confirmedPassword: String)
}

// MARK: - View 
protocol CreatePasswordViewProtocol: class {
  var presenter: CreatePasswordPresenterProtocol? { get set }
    
    func show(errorMessage: String)
}
