//
//  TutorListRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorListRouter: TutorListWireframeProtocol {
    private weak var viewController: UIViewController?
    private weak var delegate: TutorListDelegate?
}

extension TutorListRouter {
    func presentTutorProfile(_ delegate: TutorProfileDelegate?) {
        viewController?.show(TutorProfileRouter.createModule(delegate), sender: nil)
    }
    
    func completed(with tutor: String) {
        delegate?.didSelectTutor(tutor)
    }
}

extension TutorListRouter {
    static func createModule(_ delegate: TutorListDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .tutorList)
        let view: TutorListViewController = storyboard.instantiateViewController()
        let interactor = TutorListInteractor()
        let router = TutorListRouter()
        let presenter = TutorListPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}
