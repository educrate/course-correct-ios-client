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
    
    // MARK: View Outlets
    @IBOutlet private weak var locationSelector: UIDropDownView! {
        didSet {
            locationSelector.delegate = self
            locationSelector.set(UIDropDownViewConfiguration(placeholder: "Address"))
            locationSelector.reload()
        }
    }
    
    // MARK: Deinitialization Verification
    deinit {
        print("deinitialized add location screen")
    }
}

extension AddLocationViewController: UIDropDownViewDelegate {
    func inputChanged(_ sender: UITextField) {
        
    }
    
    func dropDown(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
