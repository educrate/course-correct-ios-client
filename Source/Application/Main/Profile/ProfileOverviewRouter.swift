//
//  ProfileOverviewRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileOverviewRouter: ProfileOverviewWireframeProtocol {
    weak var viewController: UIViewController?
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

extension ProfileOverviewRouter {
    func presentAccount() {
        viewController?.navigationController?.pushViewController(ProfileAccountRouter.createModule(), animated: true)
    }
    
    func presentPayment() {
        viewController?.navigationController?.pushViewController(ProfilePaymentRouter.createModule(), animated: true)
    }
    
    func presentSupport() {
        viewController?.navigationController?.pushViewController(ProfileSupportRouter.createModule(), animated: true)
    }
    
    func presentWelcome(_ delegate: WelcomeViewControllerDelegate?) {
        viewController?.navigationController?.pushViewController(WelcomeRouter.createModule(delegate), animated: true)
    }
}
