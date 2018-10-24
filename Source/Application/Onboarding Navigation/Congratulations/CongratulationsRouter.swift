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
    weak var delegate: CongratulationsRouterDelegate?
}

extension CongratulationsRouter {
    static func createModule(_ delegate: CongratulationsRouterDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .congratulations)
        let view: CongratulationsViewController = storyboard.instantiateViewController()
        let interactor = CongratulationsInteractor()
        let router = CongratulationsRouter()
        let presenter = CongratulationsPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}
