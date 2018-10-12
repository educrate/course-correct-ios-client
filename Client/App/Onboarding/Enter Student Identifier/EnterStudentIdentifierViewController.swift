//
//  EnterStudentIdentifierViewController.swift
//  Client
//
//  Created Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterStudentIdentifierViewController: UIViewController, EnterStudentIdentifierViewProtocol {
    
    // MARK: Viper
	var presenter: EnterStudentIdentifierPresenterProtocol?
    
    // MARK: Views
    @IBOutlet weak var field: UIFieldViewController!
}

extension EnterStudentIdentifierViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fieldViewController: UIFieldViewController = segue.viewController()
        field = fieldViewController
    }
}
