//
//  WalkthroughBuilder.swift
//  Client
//
//  Created by Ampe on 12/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class WalkthroughBuilder {
    func create(_ delegate: WalkthroughDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .walkthrough)
        let view: WalkthroughViewController = storyboard.instantiateViewController()
        let interactor = WalkthroughInteractor()
        let router = WalkthroughRouter()
        let presenter = WalkthroughPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        presenter.view = view
        presenter.interactor = interactor
        presenter.delegate = delegate
        
        return view
    }
}
