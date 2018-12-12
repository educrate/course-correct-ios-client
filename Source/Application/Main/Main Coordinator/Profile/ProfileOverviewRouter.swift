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
    private weak var delegate: ProfileOverviewDelegate?
}

extension ProfileOverviewRouter {
    func presentAccount() {
        viewController?.show(ProfileAccountRouter.createModule(), sender: nil)
    }
    
    func presentPayment() {
        viewController?.show(ProfilePaymentRouter.createModule(), sender: nil)
    }
    
    func presentSupport() {
        viewController?.show(ProfileSupportRouter.createModule(), sender: nil)
    }
    
    func presentLogout() {
        delegate?.profileOverviewRouter(self, didSignOut: "user signed out")
    }
}

extension ProfileOverviewRouter {
    static func createModule(_ delegate: ProfileOverviewDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .profileOverview)
        let view: ProfileOverviewViewController = storyboard.instantiateViewController()
        let interactor = ProfileOverviewInteractor()
        let router = ProfileOverviewRouter()
        let presenter = ProfileOverviewPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}
