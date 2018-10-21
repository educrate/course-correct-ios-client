//
//  AppRouter.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppRouter: AppWireframeProtocol {}

extension AppRouter {
    static func createModule() -> AppPresenterProtocol {
        let interactor = AppInteractor()
        let router = AppRouter()
        let presenter = AppPresenter(interactor: interactor, router: router)
        
        interactor.presenter = presenter
        
        return presenter
    }
}

extension AppRouter {
    func routeToOnboarding() {
        
    }
    
    func routeIntoApplication() {
        
    }
}
