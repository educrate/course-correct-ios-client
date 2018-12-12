//
//  WelcomeProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol WelcomeDelegate: class {
    func welcome(didSignUp user: String)
    func welcome(didSignIn user: String)
}

// MARK: - Wireframe
protocol WelcomeWireframeProtocol: SignUpDelegate, SignInDelegate {
    func presentSignUp()
    func presentSignIn()
}

// MARK: - Presenter
protocol WelcomePresenterProtocol: class {
    func showSignUp()
    func showSignIn()
}

// MARK: - Interactor
protocol WelcomeInteractorProtocol: class {
  var presenter: WelcomePresenterProtocol? { get set }
}

// MARK: - View
protocol WelcomeViewProtocol: class {
  var presenter: WelcomePresenterProtocol? { get set }
}
