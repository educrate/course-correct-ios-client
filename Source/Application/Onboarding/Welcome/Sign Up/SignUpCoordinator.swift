//
//  SignUpCoordinator.swift
//  Client
//
//  Created by Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class SignUpCoordinator {}

extension SignUpCoordinator: Coordinator {
    func start() {
        
    }
}

extension SignUpCoordinator: SelectCollegeViewControllerDelegate {
    func selectCollegeViewController(_ selectCollegeViewController: SelectCollegeViewController, didSelect college: String) {
        
    }
}

extension SignUpCoordinator: EnterStudentIdentifierViewControllerDelegate {
    func enterStudentIdentifierViewController(_ enterStudentIdentifierViewController: EnterStudentIdentifierViewController, didEnter studentIdentifier: String) {
        
    }
}

extension SignUpCoordinator: EnterAccessCodeViewControllerDelegate {
    func enterAccessCodeViewController(_ enterAccessCodeViewController: EnterAccessCodeViewController, didEnter accessCode: String) {
        
    }
}

extension SignUpCoordinator: CreatePasswordViewControllerDelegate {
    func createPasswordViewController(_ createPasswordViewController: CreatePasswordViewController, didCreate password: String) {
        
    }
}
