//
//  ProfilePaymentRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfilePaymentRouter: ProfilePaymentWireframeProtocol {
    weak var viewController: UIViewController?
}

extension ProfilePaymentRouter {
    func presentAddCard() {
        viewController?.navigationController?.pushViewController(ManageCardRouter.createModule(), animated: true)
    }
    
    func presentAddBank() {
        viewController?.navigationController?.pushViewController(ManageBankRouter.createModule(), animated: true)
    }   
}
