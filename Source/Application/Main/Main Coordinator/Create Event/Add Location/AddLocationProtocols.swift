//
//  AddLocationProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol AddLocationWireframeProtocol: class {}


// MARK: - Presenter

protocol AddLocationPresenterProtocol: class {}


// MARK: - Interactor

protocol AddLocationInteractorProtocol: class {
    var presenter: AddLocationPresenterProtocol? { get set }
    
    func request(autocomplete search: String)
}


// MARK: - View 

protocol AddLocationViewProtocol: class {
    var presenter: AddLocationPresenterProtocol? { get set }
}
