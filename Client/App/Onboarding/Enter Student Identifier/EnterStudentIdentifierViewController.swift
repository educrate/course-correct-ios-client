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
        let fieldViewController: UIFieldViewController = segue.viewController()
        field = fieldViewController
    }
}

extension EnterStudentIdentifierViewController {
    func show(error: EnterStudentIdentifierError) {
        
    }
}
