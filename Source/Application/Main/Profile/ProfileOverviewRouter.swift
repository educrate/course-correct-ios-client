//
//  ProfileOverviewRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileOverviewRouter: ProfileOverviewWireframeProtocol {
    private weak var viewController: UIViewController?
}

extension ProfileOverviewRouter {
    func presentAccount() {
        
    }
    
    func presentPayment() {
        
    }
    
    func presentSupport() {
        
    }
    
    func presentWelcome() {
        
    }
}

extension ProfileOverviewRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .profileOverview)
        let view: ProfileOverviewViewController = storyboard.instantiateViewController()
        let interactor = ProfileOverviewInteractor()
        let router = ProfileOverviewRouter()
        let presenter = ProfileOverviewPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
