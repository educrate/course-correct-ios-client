//
//  ProfilePaymentViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfilePaymentViewController: UIViewController, ProfilePaymentViewProtocol {
	var presenter: ProfilePaymentPresenterProtocol?
    
    deinit {
        print("deinitialized profile payment screen")
    }
}

extension ProfilePaymentViewController {
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        let manageCardOption = UIActionViewOption(title: "Manage payment methods",
                                                  action: presenter?.showAddCard)
        
        let manageBankingOption = UIActionViewOption(title: "Manage banking information",
                                                     action: presenter?.showAddBank)
        
        let cancelOption = UIActionViewOption(title: "Cancel")
        
        UIActionView.show(with: [manageCardOption,
                                 manageBankingOption,
                                 cancelOption])
    }
}
