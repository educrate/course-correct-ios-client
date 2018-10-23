//
//  CongratulationsProtocols.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol CongratulationsWireframeProtocol: class, Wireframe {}


// MARK: - Presenter

protocol CongratulationsPresenterProtocol: class {}


// MARK: - Interactor

protocol CongratulationsInteractorProtocol: class {
  var presenter: CongratulationsPresenterProtocol?  { get set }
}


// MARK: - View 

protocol CongratulationsViewProtocol: class {
  var presenter: CongratulationsPresenterProtocol?  { get set }
}
