//
//  ManageCardPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ManageCardPresenter: ManageCardPresenterProtocol {
    var interactor: ManageCardInteractorProtocol?
    var router: ManageCardWireframeProtocol?
    weak var view: ManageCardViewProtocol?
}
