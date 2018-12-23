//
//  CreatePasswordBuilder.swift
//  Client
//
//  Created by Ampe on 12/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreatePasswordBuilder {
    func create(_ delegate: CreatePasswordDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .createPassword)
        let view: CreatePasswordViewController = storyboard.instantiateViewController()
        let interactor = CreatePasswordInteractor()
        let router = CreatePasswordRouter()
        let presenter = CreatePasswordPresenter()
        
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
