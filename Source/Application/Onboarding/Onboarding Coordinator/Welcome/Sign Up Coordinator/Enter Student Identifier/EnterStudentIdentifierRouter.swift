//
//  EnterStudentIdentifierRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EnterStudentIdentifierRouter: EnterStudentIdentifierWireframeProtocol {
    private weak var viewController: UIViewController?
    private weak var delegate: EnterStudentIdentifierRouterDelegate?
}

extension EnterStudentIdentifierRouter {
    func showNextScreen() {
        delegate?.enterStudentIdentifier(didEnter: "identifier")
    }
}

extension EnterStudentIdentifierRouter {
    static func createModule(_ delegate: EnterStudentIdentifierRouterDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .enterStudentIdentifier)
        let view: EnterStudentIdentifierViewController = storyboard.instantiateViewController()
        let interactor = EnterStudentIdentifierInteractor()
        let router = EnterStudentIdentifierRouter()
        let presenter = EnterStudentIdentifierPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}
