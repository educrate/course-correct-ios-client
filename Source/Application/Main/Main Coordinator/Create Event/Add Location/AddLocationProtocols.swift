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
    func didAddLocation(_ location: Any)
}

// MARK: - Wireframe
protocol AddLocationWireframeProtocol: class {}

// MARK: - Presenter
protocol AddLocationPresenterProtocol: class {
    func fetch(autocomplete text: String)
    func autocompleteFetched(for search: String, with result: Result<AddLocationAutocompleteResponse, AddLocationError>)
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
