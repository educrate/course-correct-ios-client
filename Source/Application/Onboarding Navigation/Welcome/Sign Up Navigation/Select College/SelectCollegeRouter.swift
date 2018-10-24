//
//  SelectCollegeRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectCollegeRouter: SelectCollegeWireframeProtocol {
    weak var viewController: UIViewController?
}

extension SelectCollegeRouter {
    static func createModule(_ delegate: SelectCollegeViewControllerDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .selectCollege)
        let view: SelectCollegeViewController = storyboard.instantiateViewController()
        let interactor = SelectCollegeInteractor()
        let router = SelectCollegeRouter()
        let presenter = SelectCollegePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        view.delegate = delegate
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension SelectCollegeRouter {
    func presentEnterStudentIdentifier() {
        
    }
}
