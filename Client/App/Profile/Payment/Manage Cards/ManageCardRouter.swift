//
//  ManageCardRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ManageCardRouter: ManageCardWireframeProtocol {
    weak var viewController: UIViewController?
}

extension ManageCardRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .manageCard)
        let view: ManageCardViewController = storyboard.instantiateViewController()
        let interactor = ManageCardInteractor()
        let router = ManageCardRouter()
        let presenter = ManageCardPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
