//
//  ProfileSupportRouter.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileSupportRouter: ProfileSupportWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = ProfileSupportViewController(nibName: nil, bundle: nil)
        let interactor = ProfileSupportInteractor()
        let router = ProfileSupportRouter()
        let presenter = ProfileSupportPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
