//
//  NewEventProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol NewEventWireframeProtocol: class, ModuleWireframeable {}


// MARK: - Presenter

protocol NewEventPresenterProtocol: class {}


// MARK: - Interactor

protocol NewEventInteractorProtocol: class {
  var presenter: NewEventPresenterProtocol? { get set }
}


// MARK: - View 

protocol NewEventViewProtocol: class {
  var presenter: NewEventPresenterProtocol? { get set }
}
