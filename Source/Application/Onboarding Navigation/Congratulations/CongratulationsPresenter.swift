//
//  CongratulationsPresenter.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CongratulationsPresenter: CongratulationsPresenterProtocol {
    
    // MARK: Viper
    weak private var view: CongratulationsViewProtocol?
    var interactor: CongratulationsInteractorProtocol?
    private let router: CongratulationsWireframeProtocol
    
    // MARK Coordinator
    private weak var coordinator: CongratulationsViewControllerDelegate?

    init(interface: CongratulationsViewProtocol,
         interactor: CongratulationsInteractorProtocol?,
         router: CongratulationsWireframeProtocol,
         coordinator: CongratulationsViewControllerDelegate?) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.coordinator = coordinator
    }
}
