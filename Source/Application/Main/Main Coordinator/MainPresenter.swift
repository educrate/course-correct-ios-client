//
//  MainPresenter.swift
//  Client
//
//  Created Ampe on 10/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class MainPresenter: MainPresenterProtocol {
    var interactor: MainInteractorProtocol?
    private let router: MainWireframeProtocol
    
    init(interactor: MainInteractorProtocol?,
        router: MainWireframeProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension MainPresenter {
    func start() {
        router.presentCalendar()
    }
}
