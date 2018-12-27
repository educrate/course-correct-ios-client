//
//  ProfilePaymentBuilder.swift
//  Client
//
//  Created by Ampe on 12/26/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfilePaymentBuilder {
    func create() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .profilePayment)
        let view: ProfilePaymentViewController = storyboard.instantiateViewController()
        let interactor = ProfilePaymentInteractor()
        let router = ProfilePaymentRouter()
        let presenter = ProfilePaymentPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
