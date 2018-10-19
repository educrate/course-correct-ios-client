//
//  ManageBankRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ManageBankRouter: ManageBankWireframeProtocol {
    weak var viewController: UIViewController?
}

extension ManageBankRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .manageBank)
        let view: ManageBankViewController = storyboard.instantiateViewController()
        let interactor = ManageBankInteractor()
        let router = ManageBankRouter()
        let presenter = ManageBankPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
