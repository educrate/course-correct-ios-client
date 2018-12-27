//
//  ManageBankProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Wireframe
protocol ManageBankWireframeProtocol: class {}

// MARK: - Presenter
protocol ManageBankPresenterProtocol: class {
    var router: ManageBankWireframeProtocol? { get set }
    var interactor: ManageBankInteractorProtocol? { get set }
    var view: ManageBankViewProtocol? { get set }
}

// MARK: - Interactor
protocol ManageBankInteractorProtocol: class {
  var presenter: ManageBankPresenterProtocol?  { get set }
}

// MARK: - View
protocol ManageBankViewProtocol: class {
  var presenter: ManageBankPresenterProtocol?  { get set }
}
