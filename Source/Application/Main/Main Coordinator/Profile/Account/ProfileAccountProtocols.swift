//
//  ProfileAccountProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Wireframe
protocol ProfileAccountWireframeProtocol: class {}

// MARK: - Presenter
protocol ProfileAccountPresenterProtocol: class {
    var router: ProfileAccountWireframeProtocol? { get set }
    var interactor: ProfileAccountInteractorProtocol? { get set }
    var view: ProfileAccountViewProtocol? { get set }
}

// MARK: - Interactor
protocol ProfileAccountInteractorProtocol: class {
  var presenter: ProfileAccountPresenterProtocol? { get set }
}

// MARK: - View 
protocol ProfileAccountViewProtocol: class {
  var presenter: ProfileAccountPresenterProtocol? { get set }
}
