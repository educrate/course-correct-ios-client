//
//  TutorProfileBuilder.swift
//  Client
//
//  Created by Ampe on 12/26/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorProfileBuilder {
    func create(_ delegate: TutorProfileDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .tutorProfile)
        let view: TutorProfileViewController = storyboard.instantiateViewController()
        let interactor = TutorProfileInteractor()
        let router = TutorProfileRouter()
        let presenter = TutorProfilePresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.delegate = delegate
        
        return view
    }
}
