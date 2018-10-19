//
//  ProfilePaymentViewController.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfilePaymentViewController: UIViewController, ProfilePaymentViewProtocol {
	var presenter: ProfilePaymentPresenterProtocol?
}

extension ProfilePaymentViewController {
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        let addCardOption = UIActionSheetOption(title: "Add payment method",
                                                action: presenter?.showAddCard)
        
        let addBankOption = UIActionSheetOption(title: "Add banking information",
                                                action: presenter?.showAddBank)
        
        UIActionSheetViewController.show(with: [addCardOption,
                                                addBankOption])
    }
}
