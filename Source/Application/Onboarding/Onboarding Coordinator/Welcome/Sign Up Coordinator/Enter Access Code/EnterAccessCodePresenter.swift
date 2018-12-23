//
//  EnterAccessCodePresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterAccessCodePresenter: EnterAccessCodePresenterProtocol {
    var interactor: EnterAccessCodeInteractorProtocol?
    var router: EnterAccessCodeWireframeProtocol?
    weak var view: EnterAccessCodeViewProtocol?
    weak var delegate: EnterAccessCodeDelegate?
}

extension EnterAccessCodePresenter {
    func accessCodeEntered(with value: String) {
        interactor?.validate(value)
    }
    
    func accessCodeValidated(for code: String, with result: Result<Void, EnterAccessCodeError>) {
        switch result {
        case .success:
            delegate?.enterAccessCode(didEnter: code)
        case .failure(let error):
            view?.show(errorMessage: error.message)
        }
    }
}
