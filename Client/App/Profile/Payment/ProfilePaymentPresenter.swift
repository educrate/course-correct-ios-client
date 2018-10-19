//
//  ProfilePaymentPresenter.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfilePaymentPresenter: ProfilePaymentPresenterProtocol {
    weak private var view: ProfilePaymentViewProtocol?
    var interactor: ProfilePaymentInteractorProtocol?
    private let router: ProfilePaymentWireframeProtocol

    init(interface: ProfilePaymentViewProtocol,
         interactor: ProfilePaymentInteractorProtocol?,
         router: ProfilePaymentWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension ProfilePaymentPresenter {
    func showAddCard() {
        router.presentAddCard()
    }
    
    func showAddBank() {
        router.presentAddBank()
    }
}
