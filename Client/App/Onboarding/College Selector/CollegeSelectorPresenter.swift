//
//  CollegeSelectorPresenter.swift
//  Client
//
//  Created Ampe on 10/9/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CollegeSelectorPresenter: CollegeSelectorPresenterProtocol, CollegeSelectorInteractorOutputProtocol {

    weak private var view: CollegeSelectorViewProtocol?
    var interactor: CollegeSelectorInteractorInputProtocol?
    private let router: CollegeSelectorWireframeProtocol

    init(interface: CollegeSelectorViewProtocol, interactor: CollegeSelectorInteractorInputProtocol?, router: CollegeSelectorWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
