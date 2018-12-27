//
//  EventBuilder.swift
//  Client
//
//  Created by Ampe on 12/26/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EventBuilder {
    func create() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .event)
        let view: EventViewController = storyboard.instantiateViewController()
        let interactor = EventInteractor()
        let router = EventRouter()
        let presenter = EventPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
