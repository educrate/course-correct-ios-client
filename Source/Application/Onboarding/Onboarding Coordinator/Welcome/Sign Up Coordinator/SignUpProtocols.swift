//
//  SignUpProtocols.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol SignUpDelegate: class {
    func signUp(didSignUp user: String)
}

// MARK: - Wireframe
protocol SignUpWireframeProtocol: SelectCollegeDelegate, EnterStudentIdentifierDelegate, EnterAccessCodeDelegate, CreatePasswordDelegate {
    func showSelectCollege()
    func showEnterStudentIdentifier()
    func showEnterAccessCode()
    func showCreatePassword()
}

// MARK: - Presenter
protocol SignUpPresenterProtocol: class {}

// MARK: - Interactor
protocol SignUpInteractorProtocol: class {
  var presenter: SignUpPresenterProtocol?  { get set }
}

// MARK: - View
protocol SignUpViewProtocol: class {
  var presenter: SignUpPresenterProtocol?  { get set }
}
