//
//  OnboardingPresenter.swift
//  Client
//
//  Created Ampe on 10/9/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import UIKit

class OnboardingPresenter: OnboardingPresenterProtocol, OnboardingInteractorOutputProtocol {

    weak private var view: OnboardingViewProtocol?
    var interactor: OnboardingInteractorInputProtocol?
    private let router: OnboardingWireframeProtocol

    init(interface: OnboardingViewProtocol, interactor: OnboardingInteractorInputProtocol?, router: OnboardingWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
