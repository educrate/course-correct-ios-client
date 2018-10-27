//
//  SelectCollegeRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectCollegeRouter: SelectCollegeWireframeProtocol {
    private weak var viewController: UIViewController?
    private weak var delegate: SelectCollegeRouterDelegate?
}

extension SelectCollegeRouter {
    func showNextScreen() {
        delegate?.selectCollege(didSelect: "college")
    }
}

extension SelectCollegeRouter {
    static func createModule(_ delegate: SelectCollegeRouterDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .selectCollege)
        let view: SelectCollegeViewController = storyboard.instantiateViewController()
        let interactor = SelectCollegeInteractor()
        let router = SelectCollegeRouter()
        let presenter = SelectCollegePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}
