//
//  WalkthroughProtocols.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol WalkthroughWireframeProtocol: class {}


// MARK: - Presenter

protocol WalkthroughPresenterProtocol: class {}


// MARK: - Interactor

protocol WalkthroughInteractorProtocol: class {
  var presenter: WalkthroughPresenterProtocol?  { get set }
}


// MARK: - View 

protocol WalkthroughViewProtocol: class {
  var presenter: WalkthroughPresenterProtocol?  { get set }
}
