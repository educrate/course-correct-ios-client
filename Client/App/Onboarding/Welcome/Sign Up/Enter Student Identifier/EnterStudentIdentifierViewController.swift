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
    @IBOutlet weak var field: UIFieldViewController!
}

extension EnterStudentIdentifierViewController {
    @IBAction func nextPressed(_ sender: UIBarButtonItem) {
        field.endEditing()
        presenter?.studentIdentifierEntered(with: field.text)
    }
}

extension EnterStudentIdentifierViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        field.setPlaceholder("Student Identifier")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        field.beginEditing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueCase(for: segue) {
        case .field:
            field = segue.viewController()
        }
    }
}

extension EnterStudentIdentifierViewController {
    func show(error: EnterStudentIdentifierError) {
        
    }
}

extension EnterStudentIdentifierViewController: SegueIdentifiable {
    enum Segue: String {
        case field
    }
}