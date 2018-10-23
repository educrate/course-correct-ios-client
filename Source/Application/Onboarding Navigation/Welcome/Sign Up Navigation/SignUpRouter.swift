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
    static func createModule(_ delegate: SignUpPresenterDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .signUp)
        let view: SignUpViewController = storyboard.instantiateViewController()
        let interactor = SignUpInteractor()
        let router = SignUpRouter()
        let presenter = SignUpPresenter(interface: view, interactor: interactor, router: router, delegate: delegate)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension SignUpRouter {
    func showSelectCollege() {
        viewController?.show(SelectCollegeRouter.createModule(), sender: nil)
    }
    
    func showEnterStudentIdentifier() {
        viewController?.show(EnterStudentIdentifierRouter.createModule(), sender: nil)
    }
    
    func showEnterAccessCode() {
        viewController?.show(EnterAccessCodeRouter.createModule(), sender: nil)
    }
    
    func showCreatePassword() {
        viewController?.show(CreatePasswordRouter.createModule(), sender: nil)
    }
}
