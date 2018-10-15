//
//  CalendarProtocols.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol CalendarWireframeProtocol: class, ModuleWireframeable {}


// MARK: - Presenter

protocol CalendarPresenterProtocol: class {}


// MARK: - Interactor

protocol CalendarInteractorProtocol: class {
  var presenter: CalendarPresenterProtocol? { get set }
}


// MARK: - View 

protocol CalendarViewProtocol: class {
  var presenter: CalendarPresenterProtocol? { get set }
}
