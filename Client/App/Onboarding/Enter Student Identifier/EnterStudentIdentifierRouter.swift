//
//  EnterStudentIdentifierRouter.swift
//  Client
//
//  Created Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterStudentIdentifierRouter: EnterStudentIdentifierWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .enterStudentIdentifier)
        let view: EnterStudentIdentifierViewController = storyboard.instantiateViewController()
        let interactor = EnterStudentIdentifierInteractor()
        let router = EnterStudentIdentifierRouter()
        let presenter = EnterStudentIdentifierPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
