//
//  WalkthroughRouter.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class WalkthroughRouter: WalkthroughWireframeProtocol {
    private weak var viewController: UIViewController?
    private weak var delegate: WalkthroughRouterDelegate?
}

extension WalkthroughRouter {
    static func createModule(_ delegate: WalkthroughRouterDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .walkthrough)
        let view: WalkthroughViewController = storyboard.instantiateViewController()
        let interactor = WalkthroughInteractor()
        let router = WalkthroughRouter()
        let presenter = WalkthroughPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}
