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
    
    static func createModule() -> UIViewController {
        let view = WalkthroughViewController(nibName: nil, bundle: nil)
        let interactor = WalkthroughInteractor()
        let router = WalkthroughRouter()
        let presenter = WalkthroughPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
