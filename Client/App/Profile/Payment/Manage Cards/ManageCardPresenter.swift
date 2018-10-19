//
//  ManageCardPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ManageCardPresenter: ManageCardPresenterProtocol {
    weak private var view: ManageCardViewProtocol?
    var interactor: ManageCardInteractorProtocol?
    private let router: ManageCardWireframeProtocol

    init(interface: ManageCardViewProtocol,
         interactor: ManageCardInteractorProtocol?,
         router: ManageCardWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
