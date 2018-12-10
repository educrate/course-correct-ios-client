//
//  CongratulationsProtocols.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe
protocol CongratulationsWireframeProtocol: class {
    func nextScreen()
}


// MARK: - Coordinator
protocol CongratulationsRouterDelegate: class {
    func congratulations(didDisplayWith state: String)
}


// MARK: - Presenter
protocol CongratulationsPresenterProtocol: class {
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