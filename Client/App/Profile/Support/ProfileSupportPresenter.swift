//
//  ProfileSupportPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileSupportPresenter: ProfileSupportPresenterProtocol {

    weak private var view: ProfileSupportViewProtocol?
    var interactor: ProfileSupportInteractorProtocol?
    private let router: ProfileSupportWireframeProtocol

    init(interface: ProfileSupportViewProtocol, interactor: ProfileSupportInteractorProtocol?, router: ProfileSupportWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
