//
//  SignInProtocols.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol SignInWireframeProtocol: class {}


// MARK: - Presenter

protocol SignInPresenterProtocol: class {}


// MARK: - Interactor

protocol SignInInteractorProtocol: class {
  var presenter: SignInPresenterProtocol?  { get set }
}


// MARK: - View 

protocol SignInViewProtocol: class {
  var presenter: SignInPresenterProtocol?  { get set }
}
