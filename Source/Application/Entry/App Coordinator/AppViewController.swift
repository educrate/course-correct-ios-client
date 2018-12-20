//
//  AppViewController.swift
//  Client
//
//  Created Ampe on 10/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppViewController: UIClearNavigationController, AppViewProtocol {
    lazy var presenter: AppPresenterProtocol? = AppBuilder().create(with: self)
}

extension AppViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
    }
}
