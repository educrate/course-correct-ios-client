//
//  WalkthroughProtocols.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Coordinator
protocol WalkthroughDelegate: class {
    func walkthrough(didCompleteWith action: String)
}

// MARK: - Wireframe
protocol WalkthroughWireframeProtocol: class {}

// MARK: - Presenter
protocol WalkthroughPresenterProtocol: class {
    var router: WalkthroughWireframeProtocol? { get set }
    var interactor: WalkthroughInteractorProtocol? { get set }
    var view: WalkthroughViewProtocol? { get set }
    var delegate: WalkthroughDelegate? { get set }
}

// MARK: - Interactor
protocol WalkthroughInteractorProtocol: class {
  var presenter: WalkthroughPresenterProtocol?  { get set }
}

// MARK: - View
protocol WalkthroughViewProtocol: class {
  var presenter: WalkthroughPresenterProtocol?  { get set }
}
