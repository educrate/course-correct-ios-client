//
//  ManageCardViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ManageCardViewController: UIViewController, ManageCardViewProtocol {
	var presenter: ManageCardPresenterProtocol?
    
    deinit {
        print("deinitialized manage card screen")
    }
}
