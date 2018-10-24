//
//  SignInRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignInRouter: SignInWireframeProtocol {
    weak var viewController: UIViewController?
    weak var delegate: SignInRouterDelegate?
}

extension SignInRouter {
    static func createModule(_ delegate: SignInRouterDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .signIn)
        let view: SignInViewController = storyboard.instantiateViewController()
        let interactor = SignInInteractor()
        let router = SignInRouter()
        let presenter = SignInPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}

extension SignInRouter {
    func presentCalendar() {
        viewController?.show(CalendarRouter.createModule(), sender: nil)
    }
}
