//
//  OnboardingBuilder.swift
//  Client
//
//  Created by Ampe on 12/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class OnboardingBuilder {
    func create(_ delegate: OnboardingDelegate?, with navigationController: UINavigationController?) -> OnboardingPresenter {
        let interactor = OnboardingInteractor()
        let router = OnboardingRouter()
        let presenter = OnboardingPresenter()
        
        interactor.presenter = presenter
        router.navigationController = navigationController
        presenter.router = router
        presenter.interactor = interactor
        presenter.delegate = delegate
        
        return presenter
    }
}
