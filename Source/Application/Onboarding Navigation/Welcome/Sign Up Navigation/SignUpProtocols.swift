//
//  SignUpProtocols.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol SignUpWireframeProtocol: SelectCollegeViewControllerDelegate, EnterStudentIdentifierViewControllerDelegate, EnterAccessCodeViewControllerDelegate, CreatePasswordViewControllerDelegate {
    func showSelectCollege()
    func showEnterStudentIdentifier()
    func showEnterAccessCode()
    func showCreatePassword()
}


// MARK: - Presenter

protocol SignUpPresenterProtocol: class, Coordinator {}


// MARK: - Interactor

protocol SignUpInteractorProtocol: class {
  var presenter: SignUpPresenterProtocol?  { get set }
}


// MARK: - View 

protocol SignUpViewProtocol: class {
  var presenter: SignUpPresenterProtocol?  { get set }
}
