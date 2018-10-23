//
//  AppCoordinator.swift
//  Client
//
//  Created by Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

protocol AppNavigationCoordinatorDelegate: class {
    func appNavigationCoordinator(_ appNavigationCoordinator: AppNavigationCoordinator, didRespondToSignFor user: String)
}

class AppNavigationCoordinator {}

extension AppNavigationCoordinator: Coordinator {
    func start() {
        
    }
}

extension AppNavigationCoordinator: OnboardingCoordinatorDelegate {
    func onboardingCoordinator(_ onboardingCoordinator: OnboardingCoordinator, didFinishWith state: String) {
        
    }
}

extension AppNavigationCoordinator: MainCoordinatorDelegate {
    func mainCoordinator(_ mainCoordinator: MainCoordinator, didSignOut user: String) {
        
    }
}
