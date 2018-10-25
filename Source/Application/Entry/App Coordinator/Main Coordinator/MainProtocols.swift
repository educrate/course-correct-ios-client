//
//  MainProtocols.swift
//  Client
//
//  Created Ampe on 10/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe
protocol MainWireframeProtocol: class {}


// MARK: - Coordinator
protocol MainRouterDelegate: class {}


// MARK: - Presenter
protocol MainPresenterProtocol: class, Coordinator {}


// MARK: - Interactor
protocol MainInteractorProtocol: class {
    var presenter: MainPresenterProtocol?  { get set }
}
