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
}

extension EnterAccessCodeRouter {
    static func createModule(_ delegate: EnterAccessCodeViewControllerDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .enterAccessCode)
        let view: EnterAccessCodeViewController = storyboard.instantiateViewController()
        let interactor = EnterAccessCodeInteractor()
        let router = EnterAccessCodeRouter()
        let presenter = EnterAccessCodePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        view.delegate = delegate
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
