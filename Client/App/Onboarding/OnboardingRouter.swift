//
//  OnboardingRouter.swift
//  Client
//
//  Created Ampe on 10/9/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import UIKit

class OnboardingRouter: OnboardingWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = OnboardingViewController(nibName: nil, bundle: nil)
        let interactor = OnboardingInteractor()
        let router = OnboardingRouter()
        let presenter = OnboardingPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
