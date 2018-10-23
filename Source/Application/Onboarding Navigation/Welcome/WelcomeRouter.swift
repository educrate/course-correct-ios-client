//
//  WelcomeRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class WelcomeRouter: WelcomeWireframeProtocol {
    weak var viewController: UIViewController?
}

extension WelcomeRouter {
    static func createModule(_ delegate: WelcomeViewControllerDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .welcome)
        let view: WelcomeViewController = storyboard.instantiateViewController()
        let interactor = WelcomeInteractor()
        let router = WelcomeRouter()
        let presenter = WelcomePresenter(interface: view, interactor: interactor, router: router, coordinator: delegate)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension WelcomeRouter {
    func presentSignUpModule(_ delegate: SignUpPresenterDelegate?) {
        viewController?.present(SignUpRouter.createModule(delegate), animated: true)
    }
    
    func presentSignIn() {
        viewController?.show(SignInRouter.createModule(), sender: nil)
    }
}
