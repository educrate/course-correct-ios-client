//
//  CreateEventRouter.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreateEventRouter: CreateEventWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = CreateEventViewController(nibName: nil, bundle: nil)
        let interactor = CreateEventInteractor()
        let router = CreateEventRouter()
        let presenter = CreateEventPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
