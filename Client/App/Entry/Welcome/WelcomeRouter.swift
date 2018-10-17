//
//  WelcomeRouter.swift
//  Client
//
//  Created Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class WelcomeRouter: WelcomeWireframeProtocol {
    weak var viewController: UIViewController?
}

extension WelcomeRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .welcome)
        let view: WelcomeViewController = storyboard.instantiateViewController()
        let interactor = WelcomeInteractor()
        let router = WelcomeRouter()
        let presenter = WelcomePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension WelcomeRouter {
    func presentSelectCollege() {
        if let view = viewController, let navigationController = view.navigationController {
            navigationController.pushViewController(SelectCollegeRouter.createModule(), animated: true)
        }
    }
    
    func presentSignIn() {
        if let view = viewController, let navigationController = view.navigationController {
            navigationController.pushViewController(SignInRouter.createModule(), animated: true)
        }
    }
    
    
    func presentActionSheet() {
        let action1 = UIActionSheetOption(title: "Cancel")
        let action2 = UIActionSheetOption(title: "Next")
        let action3 = UIActionSheetOption(title: "Back")
        let action4 = UIActionSheetOption(title: "Close")
        
        UIActionSheetViewController.show(with: [action1, action2, action3, action4])
    }
}
