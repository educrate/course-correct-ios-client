//
//  AppRouter.swift
//  Client
//
//  Created Ampe on 10/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppRouter: AppWireframeProtocol {
    weak var viewController: UIViewController?
}

extension AppRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .app)
        let view: AppNavigationController = storyboard.instantiateViewController()
        let interactor = AppInteractor()
        let router = AppRouter()
        let presenter = AppPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
