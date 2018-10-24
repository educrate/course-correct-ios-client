//
//  AppDelegate.swift
//  Client
//
//  Created by Christian Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    lazy var presenter: AppPresenterProtocol? = AppRouter.createModule(window)
}

extension AppDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        presenter?.start()
        return true
    }
}
