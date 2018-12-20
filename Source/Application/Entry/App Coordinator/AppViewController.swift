//
//  AppViewController.swift
//  Client
//
//  Created Ampe on 10/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppViewController: UIClearNavigationController, AppViewProtocol {
    var presenter: AppPresenterProtocol?
}

extension AppViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AppBuilder().create(with: self)
        presenter?.start()
    }
}
