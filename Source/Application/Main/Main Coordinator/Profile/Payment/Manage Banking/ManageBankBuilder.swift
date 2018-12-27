//
//  ManageBankBuilder.swift
//  Client
//
//  Created by Ampe on 12/26/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ManageBankBuilder {
    func create() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .manageBank)
        let view: ManageBankViewController = storyboard.instantiateViewController()
        let interactor = ManageBankInteractor()
        let router = ManageBankRouter()
        let presenter = ManageBankPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
