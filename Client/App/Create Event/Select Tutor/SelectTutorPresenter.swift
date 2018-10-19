//
//  SelectTutorPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectTutorPresenter: SelectTutorPresenterProtocol {

    weak private var view: SelectTutorViewProtocol?
    var interactor: SelectTutorInteractorProtocol?
    private let router: SelectTutorWireframeProtocol

    init(interface: SelectTutorViewProtocol,
         interactor: SelectTutorInteractorProtocol?,
         router: SelectTutorWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
