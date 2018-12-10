//
//  AddLocationInteractor.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AddLocationInteractor: AddLocationInteractorProtocol {
    private let networking = Networking<AddLocationNetworking>()
    
    weak var presenter: AddLocationPresenterProtocol?
}

extension AddLocationInteractor {
    func request(autocomplete search: String) {
        networking.request(.autocomplete("search"), extractable: AddLocationAutocompleteResponse.self) { result in
            switch result {
            case .success(let value):
                
            case .failure(let error):
            }
        }
    }
}
