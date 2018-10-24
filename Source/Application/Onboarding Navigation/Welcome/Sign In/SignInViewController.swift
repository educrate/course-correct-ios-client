//
//  SignInViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

protocol SignInViewControllerDelegate: class {
    func signInViewController(_ signInViewController: SignInViewController, didSignIn user: String)
}


class SignInViewController: UIViewController, SignInViewProtocol {
	
    // MARK: Viper
    var presenter: SignInPresenterProtocol?
    weak var delegate: SignInViewControllerDelegate?
    
    // MARK: Views
    @IBOutlet private weak var emailField: UIFieldViewController!
    @IBOutlet private weak var passwordField: UIFieldViewController!
}

extension SignInViewController {
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        presenter?.credentialsEntered(email: emailField.text, password: passwordField.text)
    }
}

extension SignInViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.setPlaceholder("Enter Your Email")
        passwordField.setPlaceholder("Enter Your Password")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueCase(for: segue) {
        case .email:
            emailField = segue.viewController()
        case .password:
            passwordField = segue.viewController()
        }
    }
}

extension SignInViewController {
    func show(error: SignInError) {
        
    }
}

extension SignInViewController: SegueIdentifiable {
    enum Segue: String {
        case email
        case password
    }
}
