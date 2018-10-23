//
//  MainCoordinator.swift
//  Client
//
//  Created by Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

protocol MainCoordinatorDelegate {
    func mainCoordinator(_ mainCoordinator: MainCoordinator, didSignOut user: String)
}

class MainCoordinator {}

extension MainCoordinator: Coordinator {
    func start() {
        
    }
}
