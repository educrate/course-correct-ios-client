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
        viewController?.show(AddLocationBuilder().create(delegate), sender: nil)
    }
    
    func showSelectTutor(_ delegate: TutorListDelegate?) {
        viewController?.show(TutorListBuilder().create(delegate), sender: nil)
    }
    
    func unwind() {
        if let viewController = viewController {
            viewController.navigationController?.popToViewController(viewController, animated: true)
        }
    }
}
