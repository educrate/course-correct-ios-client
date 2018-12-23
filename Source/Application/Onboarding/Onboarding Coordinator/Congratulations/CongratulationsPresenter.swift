//
//  CongratulationsPresenter.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CongratulationsPresenter: CongratulationsPresenterProtocol {
    var interactor: CongratulationsInteractorProtocol?
    var router: CongratulationsWireframeProtocol?
    weak var view: CongratulationsViewProtocol?
    weak var delegate: CongratulationsDelegate?
}

extension CongratulationsPresenter {
    func screenHandled() {
        delegate?.congratulations(didDisplayWith: "congratulations")
    }
}
