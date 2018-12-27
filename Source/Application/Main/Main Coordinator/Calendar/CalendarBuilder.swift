//
//  CalendarBuilder.swift
//  Client
//
//  Created by Ampe on 12/26/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CalendarBuilder {
    func create(_ delegate: CalendarDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .calendar)
        let view: CalendarViewController = storyboard.instantiateViewController()
        let interactor = CalendarInteractor()
        let router = CalendarRouter()
        let presenter = CalendarPresenter()
        
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
