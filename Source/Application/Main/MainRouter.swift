//
//  MainRouter.swift
//  Client
//
//  Created Ampe on 10/23/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class MainRouter: MainWireframeProtocol {
    weak var viewController: UIViewController?
    private weak var delegate: MainRouterDelegate?
}

extension MainRouter {
    static func createModule(_ delegate: MainRouterDelegate?) -> UIViewController {
        let view = MainViewController(nibName: nil, bundle: nil)
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}
