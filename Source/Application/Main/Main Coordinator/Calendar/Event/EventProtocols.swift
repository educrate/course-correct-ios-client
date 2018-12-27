//
//  EventProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Wireframe
protocol EventWireframeProtocol: class {}


// MARK: - Presenter
protocol EventPresenterProtocol: class {
    var router: EventWireframeProtocol? { get set }
    var interactor: EventInteractorProtocol? { get set }
    var view: EventViewProtocol? { get set }
}

// MARK: - Interactor
protocol EventInteractorProtocol: class {
  var presenter: EventPresenterProtocol? { get set }
}

// MARK: - View 
protocol EventViewProtocol: class {
  var presenter: EventPresenterProtocol? { get set }
}
