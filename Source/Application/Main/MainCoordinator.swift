//
//  MainCoordinator.swift
//  Client
//
//  Created by Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

protocol MainCoordinatorDelegate: class {
    func mainCoordinator(_ mainCoordinator: MainCoordinator, didSignOut user: String)
}

class MainCoordinator {
    weak var delegate: MainCoordinatorDelegate?
}

extension MainCoordinator: Coordinator {
    func start() {
        
    }
}
