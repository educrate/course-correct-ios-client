//
//  EnterStudentIdentifierPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterStudentIdentifierPresenter: EnterStudentIdentifierPresenterProtocol {
    var interactor: EnterStudentIdentifierInteractorProtocol?
    var router: EnterStudentIdentifierWireframeProtocol?
    weak var view: EnterStudentIdentifierViewProtocol?
    weak var delegate: EnterStudentIdentifierDelegate?
}

extension EnterStudentIdentifierPresenter {
    func studentIdentifierEntered(with value: String) {
        interactor?.validate(studentIdentifier: value)
    }
    
    func studentIdentifierValidated(for identifier: String, with result: Result<Void, EnterStudentIdentifierError>) {
        switch result {
        case .success:
            delegate?.enterStudentIdentifier(didEnter: identifier)
        case .failure(let error):
            view?.show(errorMessage: error.message)
        }
    }
}
