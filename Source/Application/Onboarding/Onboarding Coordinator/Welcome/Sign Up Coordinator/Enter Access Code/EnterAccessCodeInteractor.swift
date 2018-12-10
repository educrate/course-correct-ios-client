//
//  EnterAccessCodeInteractor.swift
//  Client
//
//  Created by Christian Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterAccessCodeInteractor: EnterAccessCodeInteractorProtocol {
    weak var presenter: EnterAccessCodePresenterProtocol?
}

extension EnterAccessCodeInteractor {
    func validate(_ accessCode: String) {
        guard !accessCode.isEmpty else {
            presenter?.accessCodeValidated(for: accessCode, with: Result(error: .emptyAccessCode))
            return
        }
        
        guard accessCode == "0000" else {
            presenter?.accessCodeValidated(for: accessCode, with: Result(error: .invalidAccessCode))
            return
        }
        
        presenter?.accessCodeValidated(for: accessCode, with: Result(value: ()))
    }
}
