//
//  AddLocationPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AddLocationPresenter: AddLocationPresenterProtocol {
    var router: AddLocationWireframeProtocol?
    var interactor: AddLocationInteractorProtocol?
    weak var view: AddLocationViewProtocol?
    weak var delegate: AddLocationDelegate?
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
        delegate?.didAddLocation(location)
    }
}
