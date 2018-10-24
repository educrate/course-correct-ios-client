//
//  SignUpViewController.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignUpViewController: UINavigationController, SignUpViewProtocol {
    
    // MARK: Viper
	var presenter: SignUpPresenterProtocol?
}

extension SignUpViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.makeTransparent()
        DispatchQueue.main.async {
            self.presenter?.start()
        }
    }
}
