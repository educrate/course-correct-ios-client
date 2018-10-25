//
//  WalkthroughPresenter.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class WalkthroughPresenter: WalkthroughPresenterProtocol {
    
    // MARK: Viper
    weak private var view: WalkthroughViewProtocol?
    var interactor: WalkthroughInteractorProtocol?
    private let router: WalkthroughWireframeProtocol

    init(interface: WalkthroughViewProtocol,
         interactor: WalkthroughInteractorProtocol?,
         router: WalkthroughWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
