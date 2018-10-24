//
//  WelcomeProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol WelcomeWireframeProtocol: SignUpRouterDelegate, SignInRouterDelegate {
    func presentSignUpModule()
    func presentSignIn()
}


// MARK: - Coordinator

protocol WelcomeRouterDelegate: class {
    func welcomeRouter(_ welcomeRouter: WelcomeRouter, didSelect option: String)
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
