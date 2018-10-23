//
//  AppNavigationController.swift
//  Client
//
//  Created Ampe on 10/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController {
    
    // MARK: Coordinator
    var coordinator: AppNavigationCoordinator?
}

extension AppNavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator?.start()
    }
}
