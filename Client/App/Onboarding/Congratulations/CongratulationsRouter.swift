//
//  CongratulationsRouter.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CongratulationsRouter: CongratulationsWireframeProtocol {
    weak var viewController: UIViewController?
}

extension CongratulationsRouter {
    static func createModule() -> UIViewController {
        let view = CongratulationsViewController(nibName: nil, bundle: nil)
        let interactor = CongratulationsInteractor()
        let router = CongratulationsRouter()
        let presenter = CongratulationsPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
