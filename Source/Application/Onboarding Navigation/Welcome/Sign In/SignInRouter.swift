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

}

extension SignInRouter {
    static func createModule(_ delegate: SignInViewControllerDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .signIn)
        let view: SignInViewController = storyboard.instantiateViewController()
        let interactor = SignInInteractor()
        let router = SignInRouter()
        let presenter = SignInPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        view.delegate = delegate
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension SignInRouter {
    func presentCalendar() {
        viewController?.show(CalendarRouter.createModule(), sender: nil)
    }
}
