//
//  ProfileSupportBuilder.swift
//  Client
//
//  Created by Ampe on 12/26/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileSupportBuilder {
    func create() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .profileSupport)
        let view: ProfileSupportViewController = storyboard.instantiateViewController()
        let interactor = ProfileSupportInteractor()
        let router = ProfileSupportRouter()
        let presenter = ProfileSupportPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        presenter.view = view
        presenter.interactor = interactor
        presenter.view = view
        
        return view
    }
}
