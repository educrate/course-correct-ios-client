//
//  SignInViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, SignInViewProtocol {
    
    // MARK: Viper
    var presenter: SignInPresenterProtocol?
    
    // MARK: Views
    @IBOutlet private weak var emailField: UIFieldView! {
        didSet {
            emailField.set(UIFieldViewConfiguration(placeholder: "Enter your email"))
        }
    }
    
    @IBOutlet private weak var passwordField: UIFieldView! {
        didSet {
            passwordField.set(UIFieldViewConfiguration(placeholder: "Enter your password", isSecureTextEntry: true))
        }
    }

    // MARK: Deinit Verification
    deinit {
        print("deinitialized sign in screen")
    }
}

extension SignInViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.beginEditing()
    }
}

extension SignInViewController {
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        presenter?.credentialsEntered(email: emailField.text, password: passwordField.text)
    }
}

extension SignInViewController {
    func show(errorMessage: String) {
        UINotificationView.show(with: errorMessage)
    }
}
