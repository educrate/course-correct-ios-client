//
//  AddLocationProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol AddLocationDelegate: class {
    func didAddLocation(_ location: String)
}

// MARK: - Wireframe
protocol AddLocationWireframeProtocol: class {
}

// MARK: - Presenter
protocol AddLocationPresenterProtocol: class {
    var router: AddLocationWireframeProtocol? { get set }
    var interactor: AddLocationInteractorProtocol? { get set }
    var view: AddLocationViewProtocol? { get set }
    var delegate: AddLocationDelegate? { get set }
    
    func fetch(autocomplete text: String)
    func autocompleteFetched(for search: String, with result: Result<AddLocationAutocompleteResponse, AddLocationError>)
    func locationAdded(_ location: String)
}

// MARK: - Interactor
protocol AddLocationInteractorProtocol: class {
    var presenter: AddLocationPresenterProtocol? { get set }
    
    func request(autocomplete search: String)
}

// MARK: - View 
protocol AddLocationViewProtocol: class {
    var presenter: AddLocationPresenterProtocol? { get set }
    
    func show(autocomplete results: [Any])
    func show(error message: String)
}
