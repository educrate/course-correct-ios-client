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
protocol SignUpWireframeProtocol: class {
    func showSelectCollege(_ delegate: SelectCollegeDelegate?)
    func showEnterStudentIdentifier(_ delegate: EnterStudentIdentifierDelegate?)
    func showEnterAccessCode(_ delegate: EnterAccessCodeDelegate?)
    func showCreatePassword(_ delegate: CreatePasswordDelegate?)
}

// MARK: - Presenter
protocol SignUpPresenterProtocol: SelectCollegeDelegate, EnterStudentIdentifierDelegate, EnterAccessCodeDelegate, CreatePasswordDelegate {
    var router: SignUpWireframeProtocol? { get set }
    var interactor: SignUpInteractorProtocol? { get set }
    var delegate: SignUpDelegate? { get set }
}

// MARK: - Interactor
protocol SignUpInteractorProtocol: class {
  var presenter: SignUpPresenterProtocol?  { get set }
}
