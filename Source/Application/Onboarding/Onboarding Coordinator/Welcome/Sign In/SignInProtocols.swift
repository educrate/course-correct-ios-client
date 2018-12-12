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
    func showNextScreen()
}

// MARK: - Presenter
protocol SignInPresenterProtocol: class {
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
