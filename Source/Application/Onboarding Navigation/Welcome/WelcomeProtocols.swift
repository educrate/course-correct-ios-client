//
//  WelcomeProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol WelcomeWireframeProtocol: class {
    func presentSignUpModule(_ delegate: SignUpPresenterDelegate?)
    func presentSignIn()
}


// MARK: - Presenter

protocol WelcomePresenterProtocol: SignUpPresenterDelegate {
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
