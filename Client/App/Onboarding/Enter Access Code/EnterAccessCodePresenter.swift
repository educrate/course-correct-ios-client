//
//  EnterAccessCodePresenter.swift
//  Client
//
//  Created Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterAccessCodePresenter: EnterAccessCodePresenterProtocol {

    weak private var view: EnterAccessCodeViewProtocol?
    var interactor: EnterAccessCodeInteractorProtocol?
    private let router: EnterAccessCodeWireframeProtocol

    init(interface: EnterAccessCodeViewProtocol, interactor: EnterAccessCodeInteractorProtocol?, router: EnterAccessCodeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
