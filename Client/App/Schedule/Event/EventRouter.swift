//
//  EventRouter.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EventRouter: EventWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = EventViewController(nibName: nil, bundle: nil)
        let interactor = EventInteractor()
        let router = EventRouter()
        let presenter = EventPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
