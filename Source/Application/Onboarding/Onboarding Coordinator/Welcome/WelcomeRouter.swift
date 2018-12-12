//
//  WelcomeRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class WelcomeRouter: WelcomeWireframeProtocol {
    private weak var viewController: UIViewController?
    private weak var delegate: WelcomeDelegate?
    private lazy var signUpCoordinator: SignUpPresenter? = SignUpRouter.createModule(self, with: viewController)
}

extension WelcomeRouter {
    func presentSignUp() {
        signUpCoordinator?.start()
    }
    
    func presentSignIn() {
        viewController?.show(SignInRouter.createModule(self), sender: nil)
    }
}

extension WelcomeRouter {
    func signUp(didSignUp user: String) {
        delegate?.welcome(didSignUp: user)
    }
    
    func signIn(didSignIn user: String) {
        delegate?.welcome(didSignIn: user)
    }
}

extension WelcomeRouter {
    static func createModule(_ delegate: WelcomeDelegate?) -> UIViewController {
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
