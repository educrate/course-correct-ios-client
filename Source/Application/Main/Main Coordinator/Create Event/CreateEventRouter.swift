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
    func showAddLocation(_ delegate: AddLocationDelegate?) {
        viewController?.show(AddLocationRouter.createModule(delegate), sender: nil)
    }
    
    func showSelectTutor(_ delegate: TutorListDelegate?) {
        viewController?.show(TutorListRouter.createModule(delegate), sender: nil)
    }
    
    func unwind() {
        if let viewController = viewController {
            viewController.navigationController?.popToViewController(viewController, animated: true)
        }
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
