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
    private weak var field: UIFieldViewController!
    
    // MARK: Deinit Verification
    deinit {
        print("deinitialized enter student identifier screen")
    }
}

extension EnterStudentIdentifierViewController {
    @IBAction func nextPressed(_ sender: UIBarButtonItem) {
        field.endEditing()
        presenter?.studentIdentifierEntered(with: field.text)
    }
}

extension EnterStudentIdentifierViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        field.beginEditing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueCase(for: segue) {
        case .field:
            field = segue.viewController()
            field.style(with: "Enter your student identifier")
        }
    }
}

extension EnterStudentIdentifierViewController {
    func show(error: EnterStudentIdentifierError) {
        
    }
}

extension EnterStudentIdentifierViewController: SegueIdentifiable {
    enum Segue: String {
        case field = "Field"
    }
}
