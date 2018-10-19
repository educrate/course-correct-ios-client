//
//  WelcomeViewController.swift
//  Client
//
//  Created Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, WelcomeViewProtocol {
	var presenter: WelcomePresenterProtocol?
}

private extension WelcomeViewController {
    @IBAction func createAccountPressed(_ sender: UIButton, forEvent event: UIEvent) {
        presenter?.showSelectCollege()
    }
    
    @IBAction func signInPressed(_ sender: UIButton, forEvent event: UIEvent) {
        presenter?.showSignIn()
    }
}
