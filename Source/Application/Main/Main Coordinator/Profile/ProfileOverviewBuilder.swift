//
//  ProfileOverviewBuilder.swift
//  Client
//
//  Created by Ampe on 12/26/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileOverviewBuilder {
    func create(_ delegate: ProfileOverviewDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .profileOverview)
        let view: ProfileOverviewViewController = storyboard.instantiateViewController()
        let interactor = ProfileOverviewInteractor()
        let router = ProfileOverviewRouter()
        let presenter = ProfileOverviewPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.delegate = delegate
        
        return view
    }
}
