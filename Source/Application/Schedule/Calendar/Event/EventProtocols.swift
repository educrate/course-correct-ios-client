//
//  EventProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol EventWireframeProtocol: class, Wireframe {}


// MARK: - Presenter

protocol EventPresenterProtocol: class {}


// MARK: - Interactor

protocol EventInteractorProtocol: class {
  var presenter: EventPresenterProtocol? { get set }
}


// MARK: - View 

protocol EventViewProtocol: class {
  var presenter: EventPresenterProtocol? { get set }
}
