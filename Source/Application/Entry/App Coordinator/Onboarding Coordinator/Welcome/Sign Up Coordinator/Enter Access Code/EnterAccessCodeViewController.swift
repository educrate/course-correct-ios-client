//
//  EnterAccessCodeViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterAccessCodeViewController: UIViewController, EnterAccessCodeViewProtocol {
	
    // MARK: Viper
    var presenter: EnterAccessCodePresenterProtocol?
    
    // MARK: IBOutlets
    private weak var field: UIFieldViewController!
    
    // MARK: Deinit Verification
    deinit {
        print("deinitialized enter access code screen")
    }
}

extension EnterAccessCodeViewController {
    @IBAction func nextPressed(_ sender: UIBarButtonItem) {
        field.endEditing()
        presenter?.accessCodeEntered(with: field.text)
    }
}

extension EnterAccessCodeViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        field.beginEditing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueCase(for: segue) {
        case .field:
            field = segue.viewController()
            field.style(with: UIFieldConfiguration(placeholder: "Enter your access code", keyboardType: .numberPad))
        }
    }
}

extension EnterAccessCodeViewController {
    func show(errorMessage: String) {
        UINotificationViewController.show(with: errorMessage)
    }
}

extension EnterAccessCodeViewController: SegueIdentifiable {
    enum Segue: String {
        case field = "Field"
    }
}
