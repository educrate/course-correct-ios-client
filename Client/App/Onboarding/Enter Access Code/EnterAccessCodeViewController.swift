//
//  EnterAccessCodeViewController.swift
//  Client
//
//  Created Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterAccessCodeViewController: UIViewController, EnterAccessCodeViewProtocol {
	
    // MARK: Viper
    var presenter: EnterAccessCodePresenterProtocol?
    
    // MARK: IBOutlets
    @IBOutlet private weak var field: UIFieldViewController!
}

extension EnterAccessCodeViewController {
    @IBAction func nextPressed(_ sender: UIBarButtonItem) {
        field.endEditing()
        presenter?.accessCodeEntered(with: field.text)
    }
}

extension EnterAccessCodeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        field.setPlaceholder("Access Code")
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

extension EnterAccessCodeViewController {
    func show(error: EnterAccessCodeError) {
        
    }
}

extension EnterAccessCodeViewController: SegueIdentifiable {
    enum Segue: String {
        case field
    }
}
