//
//  NewEventRouter.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class NewEventRouter: NewEventWireframeProtocol {
    weak var viewController: UIViewController?
}

extension NewEventRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .newEvent)
        let view: NewEventViewController = storyboard.instantiateViewController()
        let interactor = NewEventInteractor()
        let router = NewEventRouter()
        let presenter = NewEventPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
