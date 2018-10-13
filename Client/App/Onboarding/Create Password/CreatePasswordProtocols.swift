//
//  CreatePasswordProtocols.swift
//  Client
//
//  Created Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol CreatePasswordWireframeProtocol: class, ModuleWireframeable {}


// MARK: - Presenter

protocol CreatePasswordPresenterProtocol: class {}


// MARK: - Interactor

protocol CreatePasswordInteractorProtocol: class {
  var presenter: CreatePasswordPresenterProtocol?  { get set }
}


// MARK: - View 

protocol CreatePasswordViewProtocol: class {
  var presenter: CreatePasswordPresenterProtocol?  { get set }
}
