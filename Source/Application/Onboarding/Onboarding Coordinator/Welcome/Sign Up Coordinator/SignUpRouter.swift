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
        viewController?.show(SelectCollegeBuilder().create(delegate), sender: nil)
    }
    
    func showEnterStudentIdentifier(_ delegate: EnterStudentIdentifierDelegate?) {
        viewController?.show(EnterStudentIdentifierBuilder().create(delegate), sender: nil)
    }
    
    func showEnterAccessCode(_ delegate: EnterAccessCodeDelegate?) {
        viewController?.show(EnterAccessCodeBuilder().create(delegate), sender: nil)
    }
    
    func showCreatePassword(_ delegate: CreatePasswordDelegate?) {
        viewController?.show(CreatePasswordBuilder().create(delegate), sender: nil)
    }
}
