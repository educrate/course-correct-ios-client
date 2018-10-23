//
//  SignUpProtocols.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol SignUpWireframeProtocol: class {
    func showSelectCollege()
    func showEnterStudentIdentifier()
    func showEnterAccessCode()
    func showCreatePassword()
}


// MARK: - Presenter

protocol SignUpPresenterProtocol: Coordinator, SelectCollegeViewControllerDelegate, EnterStudentIdentifierViewControllerDelegate, EnterAccessCodeViewControllerDelegate, CreatePasswordViewControllerDelegate {}


// MARK: - Interactor

protocol SignUpInteractorProtocol: class {
  var presenter: SignUpPresenterProtocol?  { get set }
}


// MARK: - View 

protocol SignUpViewProtocol: class {
  var presenter: SignUpPresenterProtocol?  { get set }
}
