//
//  AddLocationRouter.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AddLocationRouter: AddLocationWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .addLocation)
        let view: AddLocationViewController = storyboard.instantiateViewController()
        let interactor = AddLocationInteractor()
        let router = AddLocationRouter()
        let presenter = AddLocationPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
