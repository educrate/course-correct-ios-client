//
//  SelectTutorPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectTutorPresenter: SelectTutorPresenterProtocol {
    
    // MARK: - Viper
    weak private var view: SelectTutorViewProtocol?
    var interactor: SelectTutorInteractorProtocol?
    private let router: SelectTutorWireframeProtocol

    // MARK: - Initializer
    init(interface: SelectTutorViewProtocol,
         interactor: SelectTutorInteractorProtocol?,
         router: SelectTutorWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension SelectTutorPresenter {
    func selectedTutor(at indexPath: IndexPath) {
        router.presentTutorProfile()
    }
}
