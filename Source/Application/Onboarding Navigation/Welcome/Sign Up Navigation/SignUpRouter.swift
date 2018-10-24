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
    static func createModule(_ delegate: SignUpViewControllerDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .signUp)
        let view: SignUpViewController = storyboard.instantiateViewController()
        let interactor = SignUpInteractor()
        let router = SignUpRouter()
        let presenter = SignUpPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
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
    func selectCollegeViewController(_ selectCollegeViewController: SelectCollegeViewController, didSelect college: String) {
        
    }
    
    func enterStudentIdentifierViewController(_ enterStudentIdentifierViewController: EnterStudentIdentifierViewController, didEnter studentIdentifier: String) {
        
    }
    
    func enterAccessCodeViewController(_ enterAccessCodeViewController: EnterAccessCodeViewController, didEnter accessCode: String) {
        
    }
    
    func createPasswordViewController(_ createPasswordViewController: CreatePasswordViewController, didCreate password: String) {
        
    }
}
