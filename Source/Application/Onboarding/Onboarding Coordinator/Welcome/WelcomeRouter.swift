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
    private var signUpCoordinator: SignUpPresenter?
}

extension WelcomeRouter {
    func presentSignUp(_ delegate: SignUpDelegate?) {
        signUpCoordinator = SignUpBuilder().create(delegate, with: viewController)
        signUpCoordinator?.start()
    }
    
    func presentSignIn(_ delegate: SignInDelegate?) {
        viewController?.show(SignInRouter.createModule(delegate), sender: nil)
    }
}
