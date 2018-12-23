//
//  CongratulationsProtocols.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol CongratulationsDelegate: class {
    func congratulations(didDisplayWith state: String)
}

// MARK: - Wireframe
protocol CongratulationsWireframeProtocol: class {
}

// MARK: - Presenter
protocol CongratulationsPresenterProtocol: class {
    var router: CongratulationsWireframeProtocol? { get set }
    var interactor: CongratulationsInteractorProtocol? { get set }
    var view: CongratulationsViewProtocol? { get set }
    var delegate: CongratulationsDelegate? { get set }
    
    func screenHandled()
}

// MARK: - Interactor
protocol CongratulationsInteractorProtocol: class {
  var presenter: CongratulationsPresenterProtocol?  { get set }
}

// MARK: - View
protocol CongratulationsViewProtocol: class {
  var presenter: CongratulationsPresenterProtocol?  { get set }
}
