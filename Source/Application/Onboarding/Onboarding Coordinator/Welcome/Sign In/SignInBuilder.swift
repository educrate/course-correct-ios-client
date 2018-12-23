//
//  SignInBuilder.swift
//  Client
//
//  Created by Ampe on 12/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignInBuilder {
    func create(_ delegate: SignInDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .signIn)
        let view: SignInViewController = storyboard.instantiateViewController()
        let interactor = SignInInteractor()
        let router = SignInRouter()
        let presenter = SignInPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.delegate = delegate
        
        return view
    }
}
