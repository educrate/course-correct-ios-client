//
//  WelcomeBuilder.swift
//  Client
//
//  Created by Ampe on 12/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class WelcomeBuilder {
    func create(_ delegate: WelcomeDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .welcome)
        let view: WelcomeViewController = storyboard.instantiateViewController()
        let interactor = WelcomeInteractor()
        let router = WelcomeRouter()
        let presenter = WelcomePresenter()
        
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
