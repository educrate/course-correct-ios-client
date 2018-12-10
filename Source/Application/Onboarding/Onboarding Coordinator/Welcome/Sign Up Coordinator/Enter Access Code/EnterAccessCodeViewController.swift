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
    @IBOutlet private weak var accessCodeField: UIFieldView! {
        didSet {
            accessCodeField.set(UIFieldViewConfiguration(placeholder: "Enter your access code", keyboardType: .numberPad))
        }
    }
    
    // MARK: Deinit Verification
    deinit {
        print("deinitialized enter access code screen")
    }
}

extension EnterAccessCodeViewController {
    @IBAction func nextPressed(_ sender: UIBarButtonItem) {
        accessCodeField.endEditing()
        presenter?.accessCodeEntered(with: accessCodeField.text)
    }
}

extension EnterAccessCodeViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        accessCodeField.beginEditing()
    }
}

extension EnterAccessCodeViewController {
    func show(errorMessage: String) {
        UINotificationView.show(with: errorMessage)
    }
}
