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
        let addCardOption = UIActionSheetOption(title: "Add payment method",
                                                action: presenter?.showAddCard)
        
        let addBankOption = UIActionSheetOption(title: "Add banking information",
                                                action: presenter?.showAddBank)
        
        let cancelOption = UIActionSheetOption(title: "Cancel")
        
        UIActionSheetViewController.show(with: [addCardOption,
                                                addBankOption,
                                                cancelOption])
    }
}
