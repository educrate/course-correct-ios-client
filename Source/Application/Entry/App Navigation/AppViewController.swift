//
//  AppViewController.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppViewController: UINavigationController, AppViewProtocol {
    
    // MARK: Viper
    lazy var presenter: AppPresenterProtocol? = AppRouter.createModule(self)
}

extension AppViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.presenter?.start()
        }
    }
}
