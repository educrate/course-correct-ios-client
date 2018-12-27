//
//  ManageCardBuilder.swift
//  Client
//
//  Created by Ampe on 12/26/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ManageCardBuilder {
    func create() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .manageCard)
        let view: ManageCardViewController = storyboard.instantiateViewController()
        let interactor = ManageCardInteractor()
        let router = ManageCardRouter()
        let presenter = ManageCardPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
