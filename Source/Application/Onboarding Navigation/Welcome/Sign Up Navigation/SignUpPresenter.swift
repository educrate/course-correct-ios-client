//
//  SignUpPresenter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignUpPresenter: SignUpPresenterProtocol {
    
    // MARK: Viper
    weak private var view: SignUpViewProtocol?
    var interactor: SignUpInteractorProtocol?
    private let router: SignUpWireframeProtocol

    init(interface: SignUpViewProtocol,
         interactor: SignUpInteractorProtocol?,
         router: SignUpWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension SignUpPresenter {
    func start() {
        router.showSelectCollege()
    }
}

extension SignUpPresenter {
    func selectCollegeViewController(_ selectCollegeViewController: SelectCollegeViewController, didSelect college: String) {
        router.showEnterStudentIdentifier()
    }
    
    func enterStudentIdentifierViewController(_ enterStudentIdentifierViewController: EnterStudentIdentifierViewController, didEnter studentIdentifier: String) {
        router.showEnterAccessCode()
    }
    
    func enterAccessCodeViewController(_ enterAccessCodeViewController: EnterAccessCodeViewController, didEnter accessCode: String) {
        router.showCreatePassword()
    }
    
    func createPasswordViewController(_ createPasswordViewController: CreatePasswordViewController, didCreate password: String) {
        
    }
}
