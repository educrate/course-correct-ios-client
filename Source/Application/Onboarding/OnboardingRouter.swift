//
//  OnboardingRouter.swift
//  Client
//
//  Created Ampe on 10/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class OnboardingRouter: OnboardingWireframeProtocol {
    weak var navigationController: UIViewController?
}

extension OnboardingRouter {
    static func createModule() -> UINavigationController {
        let storyboard = UIStoryboard(storyboard: .onboarding)
        let view: OnboardingNavigationController = storyboard.instantiateViewController()
        let interactor = OnboardingInteractor()
        let router = OnboardingRouter()
        let presenter = OnboardingPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.navigationController = view
        
        return view
    }
}
