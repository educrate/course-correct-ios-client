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
    weak var delegate: ProfileOverviewDelegate?
}

extension ProfileOverviewRouter {
    func presentAccount() {
        viewController?.show(ProfileAccountBuilder().create(), sender: nil)
    }
    
    func presentPayment() {
        viewController?.show(ProfilePaymentBuilder().create(), sender: nil)
    }
    
    func presentSupport() {
        viewController?.show(ProfileSupportRouter.createModule(), sender: nil)
    }
    
    func presentLogout() {
        delegate?.profileOverviewRouter(self, didSignOut: "user signed out")
    }
}
