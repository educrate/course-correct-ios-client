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
protocol WelcomeWireframeProtocol: class {
    func presentSignUp(_ delegate: SignUpDelegate?)
    func presentSignIn(_ delegate: SignInDelegate?)
}

// MARK: - Presenter
protocol WelcomePresenterProtocol: SignUpDelegate, SignInDelegate {
    var router: WelcomeWireframeProtocol? { get set }
    var interactor: WelcomeInteractorProtocol? { get set }
    var view: WelcomeViewProtocol? { get set }
    var delegate: WelcomeDelegate? { get set }
    
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
