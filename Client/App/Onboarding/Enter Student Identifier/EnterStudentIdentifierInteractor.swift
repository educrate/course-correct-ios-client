//
//  EnterStudentIdentifierInteractor.swift
//  Client
//
//  Created Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterStudentIdentifierInteractor: EnterStudentIdentifierInteractorProtocol {
    weak var presenter: EnterStudentIdentifierPresenterProtocol?
}

extension EnterStudentIdentifierInteractor {
    func validate(studentIdentifier: String) {
        presenter?.studentIdentifierValidated(for: studentIdentifier, with: Result(value: ()))
    }
}
