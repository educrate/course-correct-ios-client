//
//  EnterStudentIdentifierPresenter.swift
//  Client
//
//  Created Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterStudentIdentifierPresenter: EnterStudentIdentifierPresenterProtocol {
    
    weak private var view: EnterStudentIdentifierViewProtocol?
    var interactor: EnterStudentIdentifierInteractorProtocol?
    private let router: EnterStudentIdentifierWireframeProtocol

    init(interface: EnterStudentIdentifierViewProtocol,
         interactor: EnterStudentIdentifierInteractorProtocol?,
         router: EnterStudentIdentifierWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension EnterStudentIdentifierPresenter {
    func studentIdentifierEntered(with value: String) {
        interactor?.validate(studentIdentifier: value)
    }
    
    func studentIdentifierValidated(for identifier: String, with result: Result<Void, EnterStudentIdentifierError>) {
        switch result {
        case .success:
            router.presentEnterAccessCode()
        case .failure(let error):
            view?.show(error: error)
        }
    }
}
