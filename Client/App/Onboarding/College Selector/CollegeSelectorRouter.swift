//
//  CollegeSelectorRouter.swift
//  Client
//
//  Created Ampe on 10/9/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CollegeSelectorRouter: CollegeSelectorWireframeProtocol {

    weak var viewController: UIViewController?

    static func createCollegeSelectorModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .collegeSelector)
        let view: CollegeSelectorViewController = storyboard.instantiateViewController()
        let interactor = CollegeSelectorInteractor()
        let router = CollegeSelectorRouter()
        let presenter = CollegeSelectorPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
