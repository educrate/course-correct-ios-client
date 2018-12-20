//
//  AppBuilder.swift
//  Client
//
//  Created by Ampe on 12/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppBuilder {
    func create(with navigationController: UINavigationController?) -> AppPresenter? {
        let interactor = AppInteractor()
        let presenter = AppPresenter()
        let router = AppRouter()
        
        interactor.presenter = presenter
        router.navigationController = navigationController
        presenter.interactor = interactor
        presenter.router = router
        
        return presenter
    }
}
