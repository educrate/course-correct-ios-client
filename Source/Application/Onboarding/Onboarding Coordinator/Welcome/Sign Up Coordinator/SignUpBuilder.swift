//
//  SignUpBuilder.swift
//  Client
//
//  Created by Ampe on 12/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignUpBuilder {
    func create(_ delegate: SignUpDelegate?, with viewController: UIViewController?) -> SignUpPresenter {
        let interactor = SignUpInteractor()
        let router = SignUpRouter()
        let presenter = SignUpPresenter()
        
        interactor.presenter = presenter
        router.viewController = viewController
        presenter.interactor = interactor
        presenter.router = router
        presenter.delegate = delegate
        
        return presenter
    }
}
