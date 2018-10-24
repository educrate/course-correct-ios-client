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
    
    // MARK: Deinit Verification
    deinit {
        print("deinitialized sign up module")
    }
}

extension SignUpViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.makeTransparent()
        DispatchQueue.main.async { [weak self] in
            self?.presenter?.start()
        }
    }
}
