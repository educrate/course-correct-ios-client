//
//  SignUpProtocols.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe
protocol SignUpWireframeProtocol: SelectCollegeRouterDelegate, EnterStudentIdentifierRouterDelegate, EnterAccessCodeRouterDelegate, CreatePasswordRouterDelegate {
    func showSelectCollege()
    func showEnterStudentIdentifier()
    func showEnterAccessCode()
    func showCreatePassword()
}


// MARK: - Coordinator
protocol SignUpRouterDelegate: class {
    func signUp(didSignUp user: String)
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
