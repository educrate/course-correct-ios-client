//
//  ProfilePaymentRouter.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfilePaymentRouter: ProfilePaymentWireframeProtocol {
    weak var viewController: UIViewController?
}

extension ProfilePaymentRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .profilePayment)
        let view: ProfileSupportViewController = storyboard.instantiateViewController()
        let interactor = ProfilePaymentInteractor()
        let router = ProfilePaymentRouter()
        let presenter = ProfilePaymentPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
