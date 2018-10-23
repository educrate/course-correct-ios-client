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
    private weak var delegate: WelcomeRouterDelegate?
}

extension WelcomeRouter {
    static func createModule(_ delegate: WelcomeRouterDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .welcome)
        let view: WelcomeViewController = storyboard.instantiateViewController()
        let interactor = WelcomeInteractor()
        let router = WelcomeRouter()
        let presenter = WelcomePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}

extension WelcomeRouter {
    func presentSignUpModule() {
        viewController?.present(SignUpRouter.createModule(self), animated: true)
    }
    
    func presentSignIn() {
        
    }
}

extension WelcomeRouter {
    func signUpRouter(_ signUpRouter: SignUpRouter, didSignUp user: String) {
        
    }
    
    func signInRouter(_ signInRouter: SignInRouter, didSignIn user: String) {
        
    }
}
