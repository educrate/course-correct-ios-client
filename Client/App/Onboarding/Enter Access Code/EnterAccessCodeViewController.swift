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
    @IBOutlet weak var field: UIFieldViewController!
}

extension EnterAccessCodeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fieldViewController: UIFieldViewController = segue.viewController()
        field = fieldViewController
    }
}
