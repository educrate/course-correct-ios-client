//
//  ProfileAccountProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol ProfileAccountWireframeProtocol: class, ModuleWireframeable {}


// MARK: - Presenter

protocol ProfileAccountPresenterProtocol: class {}


// MARK: - Interactor

protocol ProfileAccountInteractorProtocol: class {
  var presenter: ProfileAccountPresenterProtocol? { get set }
}


// MARK: - View 

protocol ProfileAccountViewProtocol: class {
  var presenter: ProfileAccountPresenterProtocol? { get set }
}
