//
//  AppCoordinator.swift
//  Client
//
//  Created by Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class AppCoordinator {}

extension AppCoordinator: Coordinator {
    func start() {
        
    }
}

extension AppCoordinator: OnboardingCoordinatorDelegate {
    func onboardingCoordinator(_ onboardingCoordinator: OnboardingCoordinator, didFinishWith state: String) {
        
    }
}

extension AppCoordinator: MainCoordinatorDelegate {
    func mainCoordinator(_ mainCoordinator: MainCoordinator, didLogOut user: String) {
        
    }
}
