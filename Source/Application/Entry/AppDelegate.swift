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
    var window: UIWindow?
}

extension AppDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        AppRouter.createModule(window!)?.start()
        return true
    }
}
