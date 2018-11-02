//
//  AddLocationViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController, AddLocationViewProtocol {
	
    // MARK: Viper
    var presenter: AddLocationPresenterProtocol?
    
    // MARK: Views
    private weak var locationDropdown: UIDropdownViewController!
    
    // MARK: Deinitialization Verification
    deinit {
        print("deinitialized add location screen")
    }
}

extension AddLocationViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueCase(for: segue) {
        case .dropdown:
            locationDropdown = segue.viewController()
            locationDropdown.style(with: UIDropdownConfiguration(placeholder: "Address"))
        }
    }
}

extension AddLocationViewController: UIDropdownDelegate {
    var cellHeight: CGFloat {
        return 50
    }
    
    func inputChanged(_ sender: UITextField) {
        
    }
    
    func dropdown(_ dropdown: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AddLocationViewController: SegueIdentifiable {
    enum Segue: String {
        case dropdown = "Dropdown"
    }
}
