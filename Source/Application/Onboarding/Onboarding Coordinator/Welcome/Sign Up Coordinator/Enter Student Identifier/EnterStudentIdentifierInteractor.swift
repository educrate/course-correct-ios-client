//
//  EnterStudentIdentifierInteractor.swift
//  Client
//
//  Created by Christian Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterStudentIdentifierInteractor: EnterStudentIdentifierInteractorProtocol {
    weak var presenter: EnterStudentIdentifierPresenterProtocol?
}

extension EnterStudentIdentifierInteractor {
    func validate(studentIdentifier: String) {
        guard !studentIdentifier.isEmpty else {
            presenter?.studentIdentifierValidated(for: studentIdentifier, with: Result(error: .emptyIdentifier))
            return
        }
        
        guard studentIdentifier == "76972739" else {
            presenter?.studentIdentifierValidated(for: studentIdentifier, with: Result(error: .invalidIdentifier))
            return
        }
        
        presenter?.studentIdentifierValidated(for: studentIdentifier, with: Result(value: ()))
    }
}
