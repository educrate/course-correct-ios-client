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
    @IBOutlet private weak var emailField: UIFieldViewController!
    @IBOutlet private weak var passwordField: UIFieldViewController!
    
    // MARK: Deinit Verification
    deinit {
        print("deinitialized sign in screen")
    }
}

extension SignInViewController {
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        presenter?.credentialsEntered(email: emailField.text, password: passwordField.text)
    }
}

extension SignInViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Need To Setup Configurations
        switch segueCase(for: segue) {
        case .email:
            break
//            emailField.setPlaceholder("Enter Your Email")
        case .password:
            break
//            passwordField.setPlaceholder("Enter Your Password")
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
