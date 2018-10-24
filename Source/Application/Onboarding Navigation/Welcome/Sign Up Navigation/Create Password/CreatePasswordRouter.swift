//
//  CreatePasswordRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreatePasswordRouter: CreatePasswordWireframeProtocol {
    weak var viewController: UIViewController?
    weak var delegate: CreatePasswordRouterDelegate?
}

extension CreatePasswordRouter {
    static func createModule(_ delegate: CreatePasswordRouterDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .createPassword)
        let view: CreatePasswordViewController = storyboard.instantiateViewController()
        let interactor = CreatePasswordInteractor()
        let router = CreatePasswordRouter()
        let presenter = CreatePasswordPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}

extension CreatePasswordRouter {
    func presentCalendar() {
        viewController?.show(CalendarRouter.createModule(), sender: nil)
    }
}
