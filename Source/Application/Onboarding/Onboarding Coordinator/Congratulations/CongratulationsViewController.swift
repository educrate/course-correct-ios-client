//
//  CongratulationsViewController.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CongratulationsViewController: UIViewController, CongratulationsViewProtocol {
    
    // MARK: Viper
	var presenter: CongratulationsPresenterProtocol?
    
    // MARK: Deinit Verification
    deinit {
        print("deinitialized congrautulations screen")
    }
}

private extension CongratulationsViewController {
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        presenter?.screenHandled()
    }
}
