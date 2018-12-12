//
//  AddLocationPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AddLocationPresenter: AddLocationPresenterProtocol {
    weak private var view: AddLocationViewProtocol?
    var interactor: AddLocationInteractorProtocol?
    private let router: AddLocationWireframeProtocol

    init(interface: AddLocationViewProtocol,
         interactor: AddLocationInteractorProtocol?,
         router: AddLocationWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension AddLocationPresenter {
    func fetch(autocomplete text: String) {
        interactor?.request(autocomplete: text)
    }
    
    func autocompleteFetched(for search: String, with result: Result<AddLocationAutocompleteResponse, AddLocationError>) {
        switch result {
        case .success(let response):
            view?.show(autocomplete: [response])
        case .failure(let error):
            view?.show(error: error.message)
        }
    }
    
    func locationAdded(_ location: String) {
        router.completed(with: location)
    }
}
