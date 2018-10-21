//
//  AppProtocols.swift
//  Client
//
//  Created Ampe on 10/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol AppWireframeProtocol: class {}


// MARK: - Presenter

protocol AppPresenterProtocol: class {
    func determineRootView()
}


// MARK: - Interactor

protocol AppInteractorProtocol: class {
  var presenter: AppPresenterProtocol?  { get set }
}


// MARK: - View 

protocol AppViewProtocol: class {
  var presenter: AppPresenterProtocol?  { get set }
}
