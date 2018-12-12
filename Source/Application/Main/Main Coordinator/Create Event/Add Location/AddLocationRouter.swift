//
//  AddLocationRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AddLocationRouter: AddLocationWireframeProtocol {
    private weak var viewController: UIViewController?
    private weak var delegate: AddLocationDelegate?
}

extension AddLocationRouter {
    func completed(with location: String) {
        delegate?.didAddLocation(location)
    }
}

extension AddLocationRouter {
    static func createModule(_ delegate: AddLocationDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .addLocation)
        let view: AddLocationViewController = storyboard.instantiateViewController()
        let interactor = AddLocationInteractor()
        let router = AddLocationRouter()
        let presenter = AddLocationPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}
