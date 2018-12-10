//
//  AddLocationViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController {
	
    // MARK: Viper
    var presenter: AddLocationPresenterProtocol?
    
    // MARK: View Outlets
    @IBOutlet private weak var locationSelector: UIDropDownView!
    
    // MARK: Deinitialization Verification
    deinit {
        print("deinitialized add location screen")
    }
}

// MARK: - Controller Lifecycle
extension AddLocationViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        locationSelector.delegate = self
        locationSelector.set(UIDropDownViewConfiguration(placeholder: "Address"))
        locationSelector.reload()
    }
}

// MARK: - Viper View Protocol Conformance
extension AddLocationViewController: AddLocationViewProtocol {
    func show(autocomplete results: [Any]) {
        
    }
    
    func show(error message: String) {
        
    }
}

// MARK: - Drop Down Delegate Conformance
extension AddLocationViewController: UIDropDownViewDelegate {
    func inputChanged(_ sender: UITextField) {
        presenter?.fetch(autocomplete: sender.text ?? "")
    }
    
    func dropDown(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
