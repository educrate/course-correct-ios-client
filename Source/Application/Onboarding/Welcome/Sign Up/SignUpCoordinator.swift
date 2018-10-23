//
//  SignUpCoordinator.swift
//  Client
//
//  Created by Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

protocol SignUpCoordinatorDelegate: class {
    func signUpCoordinator(_ signUpCoordinator: SignUpCoordinator, didSignUp user: String)
}

class SignUpCoordinator {
    private weak var delegate: SignUpCoordinatorDelegate?
}

extension SignUpCoordinator: Coordinator {
    func start() {
        
    }
}

extension SignUpCoordinator: SelectCollegeViewControllerDelegate {
    func selectCollegeViewController(_ selectCollegeViewController: SelectCollegeViewController, didSelect college: String) {
        selectCollegeViewController.present(SelectCollegeRouter.createModule(), animated: true)
    }
}

extension SignUpCoordinator: EnterStudentIdentifierViewControllerDelegate {
    func enterStudentIdentifierViewController(_ enterStudentIdentifierViewController: EnterStudentIdentifierViewController, didEnter studentIdentifier: String) {
        enterStudentIdentifierViewController.present(EnterStudentIdentifierRouter.createModule(), animated: true)
    }
}

extension SignUpCoordinator: EnterAccessCodeViewControllerDelegate {
    func enterAccessCodeViewController(_ enterAccessCodeViewController: EnterAccessCodeViewController, didEnter accessCode: String) {
        enterAccessCodeViewController.present(EnterAccessCodeRouter.createModule(), animated: true)
    }
}

extension SignUpCoordinator: CreatePasswordViewControllerDelegate {
    func createPasswordViewController(_ createPasswordViewController: CreatePasswordViewController, didCreate password: String) {
        delegate?.signUpCoordinator(self, didSignUp: password)
    }
}
