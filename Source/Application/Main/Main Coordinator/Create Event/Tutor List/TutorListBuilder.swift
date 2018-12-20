//
//  TutorListBuilder.swift
//  Client
//
//  Created by Ampe on 12/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorListBuilder {
    func create(_ delegate: TutorListDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .tutorList)
        let view: TutorListViewController = storyboard.instantiateViewController()
        let interactor = TutorListInteractor()
        let router = TutorListRouter()
        let presenter = TutorListPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.delegate = delegate
        router.viewController = view
        
        return view
    }
}
