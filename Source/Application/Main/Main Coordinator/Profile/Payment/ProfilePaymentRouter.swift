//
//  ProfilePaymentRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfilePaymentRouter: ProfilePaymentWireframeProtocol {
    weak var viewController: UIViewController?
}

extension ProfilePaymentRouter {
    func presentAddCard() {
        viewController?.navigationController?.pushViewController(ManageCardRouter.createModule(), animated: true)
    }
    
    func presentAddBank() {
        viewController?.navigationController?.pushViewController(ManageBankRouter.createModule(), animated: true)
    }   
}

extension ProfilePaymentRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .profilePayment)
        let view: ProfilePaymentViewController = storyboard.instantiateViewController()
        let interactor = ProfilePaymentInteractor()
        let router = ProfilePaymentRouter()
        let presenter = ProfilePaymentPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
