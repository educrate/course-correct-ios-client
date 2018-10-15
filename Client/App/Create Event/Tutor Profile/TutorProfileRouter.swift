//
//  TutorProfileRouter.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorProfileRouter: TutorProfileWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = TutorProfileViewController(nibName: nil, bundle: nil)
        let interactor = TutorProfileInteractor()
        let router = TutorProfileRouter()
        let presenter = TutorProfilePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
