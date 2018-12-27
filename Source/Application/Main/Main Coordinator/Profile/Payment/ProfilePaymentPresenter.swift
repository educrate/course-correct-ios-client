//
//  ProfilePaymentPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfilePaymentPresenter: ProfilePaymentPresenterProtocol {
    var interactor: ProfilePaymentInteractorProtocol?
    var router: ProfilePaymentWireframeProtocol?
    weak var view: ProfilePaymentViewProtocol?
}

extension ProfilePaymentPresenter {
    func showAddCard() {
        router?.presentAddCard()
    }
    
    func showAddBank() {
        router?.presentAddBank()
    }
}
