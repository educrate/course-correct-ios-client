//
//  OnboardingPresenter.swift
//  Client
//
//  Created Ampe on 10/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class OnboardingPresenter: OnboardingPresenterProtocol {
    weak private var view: OnboardingViewProtocol?
    var interactor: OnboardingInteractorProtocol?
    private let router: OnboardingWireframeProtocol

    init(interface: OnboardingViewProtocol,
         interactor: OnboardingInteractorProtocol?,
         router: OnboardingWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
