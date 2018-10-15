//
//  EnterAccessCodeInteractor.swift
//  Client
//
//  Created Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterAccessCodeInteractor: EnterAccessCodeInteractorProtocol {
    weak var presenter: EnterAccessCodePresenterProtocol?
}

extension EnterAccessCodeInteractor {
    func validate(_ accessCode: String) {
        presenter?.accessCodeValidated(for: accessCode, with: Result(value: ()))
    }
}
