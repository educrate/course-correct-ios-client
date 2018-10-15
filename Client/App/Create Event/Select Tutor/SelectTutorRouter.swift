//
//  SelectTutorRouter.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectTutorRouter: SelectTutorWireframeProtocol {
    weak var viewController: UIViewController?
}

extension SelectTutorRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .selectTutor)
        let view: SelectTutorViewController = storyboard.instantiateViewController()
        let interactor = SelectTutorInteractor()
        let router = SelectTutorRouter()
        let presenter = SelectTutorPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
