//
//  CreatePasswordViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreatePasswordViewController: UIViewController, CreatePasswordViewProtocol {
    
    // MARK: Viper
	var presenter: CreatePasswordPresenterProtocol?
    
    // MARK: Views
    private weak var passwordField: UIFieldViewController!
    private weak var confirmPasswordField: UIFieldViewController!
    
    // MARK: Deinit Verification
    deinit {
        print("deinitialized create password screen")
    }
}

private extension CreatePasswordViewController {
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        passwordField.endEditing()
        confirmPasswordField.endEditing()
        presenter?.entered(password: passwordField.text, confirmedPassword: confirmPasswordField.text)
    }
}

extension CreatePasswordViewController {  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        passwordField.beginEditing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueCase(for: segue) {
        case .password:
            passwordField = segue.viewController()
            passwordField.style(with: UIFieldConfiguration(placeholder: "Create a password", isSecureTextEntry: true))
        case .confirmPassword:
            confirmPasswordField = segue.viewController()
            confirmPasswordField.style(with: UIFieldConfiguration(placeholder: "Confirm password", isSecureTextEntry: true))
        }
    }
}

extension CreatePasswordViewController {
    func show(errorMessage: String) {
        UINotificationView.show(with: errorMessage)
    }
}

extension CreatePasswordViewController: SegueIdentifiable {
    enum Segue: String {
        case password = "Password"
        case confirmPassword = "ConfirmPassword"
    }
}
