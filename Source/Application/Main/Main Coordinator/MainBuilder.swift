//
//  MainBuilder.swift
//  Client
//
//  Created by Ampe on 12/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class MainBuilder {
    func create(_ delegate: MainDelegate?, with navigationController: UINavigationController?) -> MainPresenter {
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter()
        
        interactor.presenter = presenter
        router.viewController = navigationController
        presenter.interactor = interactor
        presenter.router = router
        presenter.delegate = delegate
        
        return presenter
    }
}
