//
//  TutorProfileRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorProfileRouter: TutorProfileWireframeProtocol {
    private weak var viewController: UIViewController?
}

extension TutorProfileRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .tutorProfile)
        let view: TutorProfileViewController = storyboard.instantiateViewController()
        let interactor = TutorProfileInteractor()
        let router = TutorProfileRouter()
        let presenter = TutorProfilePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
