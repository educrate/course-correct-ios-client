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
}

extension CreateEventRouter {
    func showAddLocation() {
        viewController?.show(AddLocationRouter.createModule(), sender: nil)
    }
    
    func showSelectTutor() {
        viewController?.show(SelectTutorRouter.createModule(), sender: nil)
    }
}

extension CreateEventRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .createEvent)
        let view: CreateEventViewController = storyboard.instantiateViewController()
        let interactor = CreateEventInteractor()
        let router = CreateEventRouter()
        let presenter = CreateEventPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
