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
    weak var delegate: SignUpRouterDelegate?
}

extension SignUpRouter {
    static func createModule(_ delegate: SignUpRouterDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .signUp)
        let view: SignUpViewController = storyboard.instantiateViewController()
        let interactor = SignUpInteractor()
        let router = SignUpRouter()
        let presenter = SignUpPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
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
}

extension SignUpRouter {
    func selectCollegeRouter(_ selectCollegeRouter: SelectCollegeRouter, didSelect college: String) {
        showEnterStudentIdentifier()
    }
    
    func enterStudentIdentifierRouter(_ enterStudentIdentifierRouter: EnterStudentIdentifierRouter, didEnter studentIdentifier: String) {
        showEnterAccessCode()
    }
    
    func enterAccessCodeRouter(_ enterAccessCodeRouter: EnterAccessCodeRouter, didEnter accessCode: String) {
        showCreatePassword()
    }
    
    func createPasswordRouter(_ createPasswordRouter: CreatePasswordRouter, didCreate password: String) {
        delegate?.signUpRouter(self, didSignUp: "new user created with password")
    }
}
