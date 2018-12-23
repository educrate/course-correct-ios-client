//
//  CongratulationsBuilder.swift
//  Client
//
//  Created by Ampe on 12/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CongratulationsBuilder {
    func create(_ delegate: CongratulationsDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .congratulations)
        let view: CongratulationsViewController = storyboard.instantiateViewController()
        let interactor = CongratulationsInteractor()
        let router = CongratulationsRouter()
        let presenter = CongratulationsPresenter()
        
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
