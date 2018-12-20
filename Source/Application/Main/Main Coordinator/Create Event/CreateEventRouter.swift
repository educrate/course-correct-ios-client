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
    private weak var delegate: CreateEventDelegate?
}

extension CreateEventRouter {
    func showAddLocation(_ delegate: AddLocationDelegate?) {
        viewController?.show(AddLocationBuilder().create(delegate), sender: nil)
    }
    
    func showSelectTutor(_ delegate: TutorListDelegate?) {
        viewController?.show(TutorListRouter.createModule(delegate), sender: nil)
    }
    
    func unwind() {
        if let viewController = viewController {
            viewController.navigationController?.popToViewController(viewController, animated: true)
        }
    }
    
    func completed() {
        delegate?.didCreateEvent("")
    }
}

extension CreateEventRouter {
    static func createModule(_ delegate: CreateEventDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .createEvent)
        let view: CreateEventViewController = storyboard.instantiateViewController()
        let interactor = CreateEventInteractor()
        let router = CreateEventRouter()
        let presenter = CreateEventPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}
