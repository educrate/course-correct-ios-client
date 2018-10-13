//
//  AppNavigation.swift
//  Client
//
//  Created by Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController {}

extension AppNavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.makeTransparent()
        setRootView()
    }
}

private extension AppNavigationController {
    func setRootView() {
        let welcomeViewController = WelcomeRouter.createModule()
        viewControllers = [welcomeViewController]
    }
}
