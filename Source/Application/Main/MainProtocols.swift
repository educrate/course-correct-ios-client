//
//  MainProtocols.swift
//  Client
//
//  Created Ampe on 10/23/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol MainWireframeProtocol: class {}


// MARK: - Presenter

protocol MainPresenterProtocol: class {}


// MARK: - Interactor

protocol MainInteractorProtocol: class {
  var presenter: MainPresenterProtocol?  { get set }
}


// MARK: - View 

protocol MainViewProtocol: class {
  var presenter: MainPresenterProtocol?  { get set }
}
