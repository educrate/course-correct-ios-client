//
//  EnterStudentIdentifierRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterStudentIdentifierRouter: EnterStudentIdentifierWireframeProtocol {
    weak var viewController: UIViewController?
}

extension EnterStudentIdentifierRouter {
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

extension EnterStudentIdentifierRouter {
    func presentEnterAccessCode() {
        viewController?.show(EnterAccessCodeRouter.createModule(), sender: nil)
    }
}
