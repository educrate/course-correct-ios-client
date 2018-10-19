//
//  EventRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EventRouter: EventWireframeProtocol {
    weak var viewController: UIViewController?
}

extension EventRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .event)
        let view: EventViewController = storyboard.instantiateViewController()
        let interactor = EventInteractor()
        let router = EventRouter()
        let presenter = EventPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
