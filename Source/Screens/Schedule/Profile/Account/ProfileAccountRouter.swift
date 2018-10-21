//
//  ProfileAccountRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileAccountRouter: ProfileAccountWireframeProtocol {
    weak var viewController: UIViewController?
}

extension ProfileAccountRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .profileAccount)
        let view: ProfileAccountViewController = storyboard.instantiateViewController()
        let interactor = ProfileAccountInteractor()
        let router = ProfileAccountRouter()
        let presenter = ProfileAccountPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
