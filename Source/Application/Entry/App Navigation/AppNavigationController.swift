//
//  AppNavigationController.swift
//  Client
//
//  Created Ampe on 10/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController, AppViewProtocol {
    lazy var presenter: AppPresenterProtocol? = AppRouter.createModule(self)
}

extension AppNavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setInitialView()
    }
}

extension AppNavigationController {
    func setInitialView() {
        presenter?.setInitialView()
    }
}

extension AppNavigationController {
    func style() {
        navigationBar.makeTransparent()
    }
}
