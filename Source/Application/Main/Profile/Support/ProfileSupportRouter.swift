//
//  ProfileSupportRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileSupportRouter: ProfileSupportWireframeProtocol {
    private weak var viewController: UIViewController?
}

extension ProfileSupportRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .profileSupport)
        let view: ProfileSupportViewController = storyboard.instantiateViewController()
        let interactor = ProfileSupportInteractor()
        let router = ProfileSupportRouter()
        let presenter = ProfileSupportPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
