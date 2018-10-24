//
//  EnterAccessCodeRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterAccessCodeRouter: EnterAccessCodeWireframeProtocol {
    weak var viewController: UIViewController?
    weak var delegate: EnterAccessCodeRouterDelegate?
}

extension EnterAccessCodeRouter {
    static func createModule(_ delegate: EnterAccessCodeRouterDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .enterAccessCode)
        let view: EnterAccessCodeViewController = storyboard.instantiateViewController()
        let interactor = EnterAccessCodeInteractor()
        let router = EnterAccessCodeRouter()
        let presenter = EnterAccessCodePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}

extension EnterAccessCodeRouter {
    func showNextScreen() {
        delegate?.enterAccessCodeRouter(self, didEnter: "access code")
    }
}
