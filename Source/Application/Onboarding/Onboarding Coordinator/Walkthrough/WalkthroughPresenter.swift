//
//  WalkthroughPresenter.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class WalkthroughPresenter: WalkthroughPresenterProtocol {
    var interactor: WalkthroughInteractorProtocol?
    var router: WalkthroughWireframeProtocol?
    weak var view: WalkthroughViewProtocol?
    weak var delegate: WalkthroughDelegate?
}
