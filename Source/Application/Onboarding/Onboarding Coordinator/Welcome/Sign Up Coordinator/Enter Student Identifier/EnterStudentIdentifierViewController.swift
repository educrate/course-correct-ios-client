//
//  EnterStudentIdentifierViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterStudentIdentifierViewController: UIViewController, EnterStudentIdentifierViewProtocol {
    
    // MARK: Viper
	var presenter: EnterStudentIdentifierPresenterProtocol?
    
    // MARK: Views
    @IBOutlet private weak var studentIdentifierField: UIFieldView! {
        didSet {
            studentIdentifierField.set(UIFieldViewConfiguration(placeholder: "Enter your student identifier", keyboardType: .numberPad))
        }
    }
    
    // MARK: Deinit Verification
    deinit {
        print("deinitialized enter student identifier screen")
    }
}

extension EnterStudentIdentifierViewController {
    @IBAction func nextPressed(_ sender: UIBarButtonItem) {
        studentIdentifierField.endEditing()
        presenter?.studentIdentifierEntered(with: studentIdentifierField.text)
    }
}

extension EnterStudentIdentifierViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        studentIdentifierField.beginEditing()
    }
}

extension EnterStudentIdentifierViewController {
    func show(errorMessage: String) {
        UINotificationView.show(with: errorMessage)
    }
}
