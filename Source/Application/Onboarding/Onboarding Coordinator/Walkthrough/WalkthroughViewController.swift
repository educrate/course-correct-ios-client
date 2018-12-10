//
//  WalkthroughViewController.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController, WalkthroughViewProtocol {
    
    // MARK: Viper
	var presenter: WalkthroughPresenterProtocol?
    
    // MARK: Deinit Verification
    deinit {
        print("deinitialized walkthrough module")
    }
}
