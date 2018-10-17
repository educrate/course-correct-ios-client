//
//  CreatePasswordProtocols.swift
//  Client
//
//  Created Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol CreatePasswordWireframeProtocol: class, ModuleWireframeable {
    func presentCalendar()
}


// MARK: - Presenter

protocol CreatePasswordPresenterProtocol: class {
    func passwordsEntered(with password: String, reenteredPassword: String)
    
    func passwordsValidated(for password: String, reenteredPassword: String, with result: Result<Void, CreatePasswordError>)
}


// MARK: - Interactor

protocol CreatePasswordInteractorProtocol: class {
  var presenter: CreatePasswordPresenterProtocol? { get set }
    
    func validate(_ password: String, reenteredPassword: String)
}


// MARK: - View 

protocol CreatePasswordViewProtocol: class {
  var presenter: CreatePasswordPresenterProtocol? { get set }
    
    func show(error: CreatePasswordError)
}
