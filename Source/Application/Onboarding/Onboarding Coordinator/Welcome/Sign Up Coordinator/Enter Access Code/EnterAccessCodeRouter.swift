//
//  EnterAccessCodeRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterAccessCodeRouter: EnterAccessCodeWireframeProtocol {
    private weak var viewController: UIViewController?
    private weak var delegate: EnterAccessCodeRouterDelegate?
}

extension EnterAccessCodeRouter {
    func showNextScreen() {
        delegate?.enterAccessCode(didEnter: "access code")
    }
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
