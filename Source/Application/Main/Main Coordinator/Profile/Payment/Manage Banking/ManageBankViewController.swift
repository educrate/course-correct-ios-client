//
//  ManageBankViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ManageBankViewController: UIViewController, ManageBankViewProtocol {
	var presenter: ManageBankPresenterProtocol?
    
    deinit {
        print("deinitialized manage bank screen")
    }
}
