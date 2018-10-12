//
//  EnterAccessCodeRouter.swift
//  Client
//
//  Created Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterAccessCodeRouter: EnterAccessCodeWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .enterAccessCode)
        let view: EnterAccessCodeViewController = storyboard.instantiateViewController()
        let interactor = EnterAccessCodeInteractor()
        let router = EnterAccessCodeRouter()
        let presenter = EnterAccessCodePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
