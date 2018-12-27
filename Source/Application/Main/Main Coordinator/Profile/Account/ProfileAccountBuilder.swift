//
//  ProfileAccountBuilder.swift
//  Client
//
//  Created by Ampe on 12/26/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileAccountBuilder {
    func create() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .profileAccount)
        let view: ProfileAccountViewController = storyboard.instantiateViewController()
        let interactor = ProfileAccountInteractor()
        let router = ProfileAccountRouter()
        let presenter = ProfileAccountPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
