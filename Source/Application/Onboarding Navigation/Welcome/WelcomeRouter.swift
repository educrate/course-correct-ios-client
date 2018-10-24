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
        let presenter = WelcomePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        view.delegate = delegate
        interactor.presenter = presenter
        router.viewController = view
        
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
    func signUpViewController(_ signUpViewController: SignUpViewController, didSignUp user: String) {
        
    }
    
    func signInViewController(_ signInViewController: SignInViewController, didSignIn user: String) {
        
    }
}
