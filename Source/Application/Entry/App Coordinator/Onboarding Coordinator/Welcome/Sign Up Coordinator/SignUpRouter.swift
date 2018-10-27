//
//  SignUpRouter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignUpRouter: SignUpWireframeProtocol {
    private weak var viewController: UIViewController?
    private weak var delegate: SignUpRouterDelegate?
}

extension SignUpRouter {
    func showSelectCollege() {
        viewController?.show(SelectCollegeRouter.createModule(self), sender: nil)
    }
    
    func showEnterStudentIdentifier() {
        viewController?.show(EnterStudentIdentifierRouter.createModule(self), sender: nil)
    }
    
    func showEnterAccessCode() {
        viewController?.show(EnterAccessCodeRouter.createModule(self), sender: nil)
    }
    
    func showCreatePassword() {
        viewController?.show(CreatePasswordRouter.createModule(self), sender: nil)
    }
    
    func dismissSignUp(_ completion: (() -> Void)?) {
        viewController?.dismiss(animated: true, completion: completion)
    }
}

extension SignUpRouter {
    func selectCollege(didSelect college: String) {
        showEnterStudentIdentifier()
    }
    
    func enterStudentIdentifier(didEnter studentIdentifier: String) {
        showEnterAccessCode()
    }
    
    func enterAccessCode(didEnter accessCode: String) {
        showCreatePassword()
    }
    
    func createPassword(didCreate password: String) {
        delegate?.signUp(didSignUp: "new user created with password")
    }
}

extension SignUpRouter {
    static func createModule(_ delegate: SignUpRouterDelegate?, with navigationController: UIViewController?) -> SignUpPresenter {
        let interactor = SignUpInteractor()
        let router = SignUpRouter()
        let presenter = SignUpPresenter(interactor: interactor, router: router)
        
        interactor.presenter = presenter
        router.viewController = navigationController
        router.delegate = delegate
        
        return presenter
    }
}
