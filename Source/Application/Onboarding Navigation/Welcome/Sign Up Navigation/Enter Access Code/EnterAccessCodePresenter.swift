//
//  EnterAccessCodePresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterAccessCodePresenter: EnterAccessCodePresenterProtocol {
    
    // MARK: Viper
    weak private var view: EnterAccessCodeViewProtocol?
    var interactor: EnterAccessCodeInteractorProtocol?
    private let router: EnterAccessCodeWireframeProtocol

    init(interface: EnterAccessCodeViewProtocol,
         interactor: EnterAccessCodeInteractorProtocol?,
         router: EnterAccessCodeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension EnterAccessCodePresenter {
    func accessCodeEntered(with value: String) {
        interactor?.validate(value)
    }
    
    func accessCodeValidated(for code: String, with result: Result<Void, EnterAccessCodeError>) {
        switch result {
        case .success:
            return
        case .failure(let error):
            view?.show(error: error)
        }
    }
}
