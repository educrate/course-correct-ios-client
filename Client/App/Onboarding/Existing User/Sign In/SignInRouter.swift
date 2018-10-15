//
//  SignInRouter.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignInRouter: SignInWireframeProtocol {
    weak var viewController: UIViewController?
}

extension SignInRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .signIn)
        let view: SignInViewController = storyboard.instantiateViewController()
        let interactor = SignInInteractor()
        let router = SignInRouter()
        let presenter = SignInPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}