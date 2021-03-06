//
//  SignInProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol SignInDelegate: class {
    func signIn(didSignIn user: String)
}

// MARK: - Wireframe
protocol SignInWireframeProtocol: class {
}

// MARK: - Presenter
protocol SignInPresenterProtocol: class {
    var router: SignInWireframeProtocol? { get set }
    var interactor: SignInInteractorProtocol? { get set }
    var view: SignInViewProtocol? { get set }
    var delegate: SignInDelegate? { get set }
    
    func credentialsEntered(email: String, password: String)
    func credentialsValidated(_ result: Result<Void, SignInError>)
}

// MARK: - Interactor
protocol SignInInteractorProtocol: class {
  var presenter: SignInPresenterProtocol? { get set }
    
    func validate(email: String, password: String)
}

// MARK: - View
protocol SignInViewProtocol: class {
  var presenter: SignInPresenterProtocol? { get set }
    
    func show(errorMessage: String)
}
