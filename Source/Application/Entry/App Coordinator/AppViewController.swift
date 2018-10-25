//
//  AppViewController.swift
//  Client
//
//  Created Ampe on 10/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppViewController: UINavigationController, AppViewProtocol {
    lazy var presenter: AppPresenterProtocol? = AppRouter.createModule(with: self)
}

extension AppViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.makeTransparent()
        presenter?.start()
    }
}
