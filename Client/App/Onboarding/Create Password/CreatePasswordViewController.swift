//
//  CreatePasswordViewController.swift
//  Client
//
//  Created Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreatePasswordViewController: UIViewController, CreatePasswordViewProtocol {
	var presenter: CreatePasswordPresenterProtocol?
    
    @IBOutlet private weak var passwordField: UIFieldViewController!
    @IBOutlet private weak var reenterPasswordField: UIFieldViewController!
}

private extension CreatePasswordViewController {
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        passwordField.endEditing()
        reenterPasswordField.endEditing()
        presenter?.passwordsEntered(with: passwordField.text, reenteredPassword: reenterPasswordField.text)
    }
}

extension CreatePasswordViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.setPlaceholder("Password")
        reenterPasswordField.setPlaceholder("Reenter Password")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        passwordField.beginEditing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueCase(for: segue) {
        case .password:
            passwordField = segue.viewController()
        case .reenter:
            reenterPasswordField = segue.viewController()
        }
    }
}

extension CreatePasswordViewController {
    func show(error: CreatePasswordError) {
        switch error {
        case .passwordsDoNotMatch:
            print("passwords do not match")
        }
    }
}

extension CreatePasswordViewController: SegueIdentifiable {
    enum Segue: String {
        case password
        case reenter
    }
}
