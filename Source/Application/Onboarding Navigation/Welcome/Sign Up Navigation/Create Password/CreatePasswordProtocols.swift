//
//  CreatePasswordProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol CreatePasswordWireframeProtocol: class {}


// MARK: - Coordinator

protocol CreatePasswordRouterDelegate: class {
    func createPasswordRouter(_ createPasswordRouter: CreatePasswordRouter, didCreate password: String)
}


// MARK: - Presenter

protocol CreatePasswordPresenterProtocol: class {
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
    
    func show(error: CreatePasswordError)
}
