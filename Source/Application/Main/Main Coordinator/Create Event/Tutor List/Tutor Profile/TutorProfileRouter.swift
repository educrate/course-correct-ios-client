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
    private weak var delegate: TutorProfileDelegate?
}

extension TutorProfileRouter {
    func completed(with tutor: String) {
        delegate?.didSelect(tutor)
    }
}

extension TutorProfileRouter {
    static func createModule(_ delegate: TutorProfileDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .tutorProfile)
        let view: TutorProfileViewController = storyboard.instantiateViewController()
        let interactor = TutorProfileInteractor()
        let router = TutorProfileRouter()
        let presenter = TutorProfilePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}
