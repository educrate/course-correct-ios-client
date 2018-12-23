//
//  AppRouter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppRouter: AppWireframeProtocol {
    weak var navigationController: UINavigationController?
    private var onboardingCoordinator: OnboardingPresenter?
    private var mainCoordinator: MainPresenter?
}

extension AppRouter {
    func presentOnboarding(_ delegate: OnboardingDelegate?) {
        onboardingCoordinator = OnboardingBuilder().create(delegate, with: navigationController)
        onboardingCoordinator?.start()
    }
    
    func presentMain(_ delegate: MainDelegate?) {
        mainCoordinator = MainBuilder().create(delegate, with: navigationController)
        mainCoordinator?.start()
    }
}
