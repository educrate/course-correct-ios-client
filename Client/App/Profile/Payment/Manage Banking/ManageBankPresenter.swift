//
//  ManageBankPresenter.swift
//  Client
//
//  Created Ampe on 10/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ManageBankPresenter: ManageBankPresenterProtocol {
    weak private var view: ManageBankViewProtocol?
    var interactor: ManageBankInteractorProtocol?
    private let router: ManageBankWireframeProtocol

    init(interface: ManageBankViewProtocol,
         interactor: ManageBankInteractorProtocol?,
         router: ManageBankWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
