//
//  WelcomeViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

protocol WelcomeViewControllerDelegate: class {
    func welcomeViewController(_ welcomeViewController: WelcomeViewController, didSignIn user: String)
}

class WelcomeViewController: UIViewController, WelcomeViewProtocol {
    
    // MARK: Viper
	var presenter: WelcomePresenterProtocol?
    weak var delegate: WelcomeViewControllerDelegate?
}

private extension WelcomeViewController {
    @IBAction func createAccountPressed(_ sender: UIButton, forEvent event: UIEvent) {
        delegate?.welcomeViewController(self, didSelect: "create account")
    }
    
    @IBAction func signInPressed(_ sender: UIButton, forEvent event: UIEvent) {
        delegate?.welcomeViewController(self, didSelect: "sign in")
    }
}
