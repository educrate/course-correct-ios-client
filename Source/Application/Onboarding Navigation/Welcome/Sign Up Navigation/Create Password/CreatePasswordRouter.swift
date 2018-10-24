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
}

extension CreatePasswordRouter {
    static func createModule(_ delegate: CreatePasswordViewControllerDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .createPassword)
        let view: CreatePasswordViewController = storyboard.instantiateViewController()
        let interactor = CreatePasswordInteractor()
        let router = CreatePasswordRouter()
        let presenter = CreatePasswordPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        view.delegate = delegate
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension CreatePasswordRouter {
    func presentCalendar() {
        viewController?.show(CalendarRouter.createModule(), sender: nil)
    }
}
