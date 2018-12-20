//
//  AddLocationBuilder.swift
//  Client
//
//  Created by Ampe on 12/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AddLocationBuilder {
    func create(_ delegate: AddLocationDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .addLocation)
        let view: AddLocationViewController = storyboard.instantiateViewController()
        let interactor = AddLocationInteractor()
        let router = AddLocationRouter()
        let presenter = AddLocationPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.delegate = delegate
        router.viewController = view
        
        return view
    }
}
