//
//  WalkthroughRouter.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class WalkthroughRouter: WalkthroughWireframeProtocol {
    weak var viewController: UIViewController?
}

extension WalkthroughRouter {
    static func createModule(_ delegate: WalkthroughViewControllerDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .walkthrough)
        let view: WalkthroughViewController = storyboard.instantiateViewController()
        let interactor = WalkthroughInteractor()
        let router = WalkthroughRouter()
        let presenter = WalkthroughPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        view.delegate = delegate
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
