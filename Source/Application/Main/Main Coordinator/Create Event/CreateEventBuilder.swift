//
//  CreateEventBuilder.swift
//  Client
//
//  Created by Ampe on 12/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreateEventBuilder {
    func create(_ delegate: CreateEventDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .createEvent)
        let view: CreateEventViewController = storyboard.instantiateViewController()
        let interactor = CreateEventInteractor()
        let router = CreateEventRouter()
        let presenter = CreateEventPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.delegate =  delegate
        router.viewController = view
        
        return view
    }
}
