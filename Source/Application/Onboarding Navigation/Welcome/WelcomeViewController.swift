//
//  WelcomeViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

protocol WelcomeViewControllerDelegate: class {
    func welcomeViewController(_ welcomeViewController: WelcomeViewController, didSelect option: String)
}

class WelcomeViewController: UIViewController, WelcomeViewProtocol {
    
    // MARK: Viper
	var presenter: WelcomePresenterProtocol?
    
    // MARK: Coordinator
    private weak var delegate: WelcomeViewControllerDelegate?
}

private extension WelcomeViewController {
    @IBAction func createAccountPressed(_ sender: UIButton, forEvent event: UIEvent) {
        presenter?.showSignUp()
    }
    
    @IBAction func signInPressed(_ sender: UIButton, forEvent event: UIEvent) {
        presenter?.showSignIn()
    }
}
