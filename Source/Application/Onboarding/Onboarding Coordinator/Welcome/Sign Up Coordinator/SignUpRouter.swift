//
//  SignUpRouter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignUpRouter: SignUpWireframeProtocol {
    weak var viewController: UIViewController?
}

extension SignUpRouter {
    func showSelectCollege(_ delegate: SelectCollegeDelegate?) {
        viewController?.show(SelectCollegeRouter.createModule(delegate), sender: nil)
    }
    
    func showEnterStudentIdentifier(_ delegate: EnterStudentIdentifierDelegate?) {
        viewController?.show(EnterStudentIdentifierRouter.createModule(delegate), sender: nil)
    }
    
    func showEnterAccessCode(_ delegate: EnterAccessCodeDelegate?) {
        viewController?.show(EnterAccessCodeRouter.createModule(delegate), sender: nil)
    }
    
    func showCreatePassword(_ delegate: CreatePasswordDelegate?) {
        viewController?.show(CreatePasswordRouter.createModule(delegate), sender: nil)
    }
}
