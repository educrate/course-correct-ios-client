//
//  CreateEventProtocols.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol CreateEventWireframeProtocol: class, ModuleWireframeable {}


// MARK: - Presenter

protocol CreateEventPresenterProtocol: class {}


// MARK: - Interactor

protocol CreateEventInteractorProtocol: class {
  var presenter: CreateEventPresenterProtocol?  { get set }
}


// MARK: - View 

protocol CreateEventViewProtocol: class {
  var presenter: CreateEventPresenterProtocol?  { get set }
}
