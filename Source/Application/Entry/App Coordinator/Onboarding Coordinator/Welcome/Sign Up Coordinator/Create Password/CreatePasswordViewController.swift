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
    @IBOutlet private weak var passwordField: UIFieldView! {
        didSet {
            passwordField.set(UIFieldViewConfiguration(placeholder: "Create a password", isSecureTextEntry: true))
        }
    }
    
    @IBOutlet private weak var confirmPasswordField: UIFieldView! {
        didSet {
            confirmPasswordField.set(UIFieldViewConfiguration(placeholder: "Confirm password", isSecureTextEntry: true))
        }
    }

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
}

extension CreatePasswordViewController {
    func show(errorMessage: String) {
        UINotificationView.show(with: errorMessage)
    }
}
