//
//  ManageBankPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ManageBankPresenter: ManageBankPresenterProtocol {
    var interactor: ManageBankInteractorProtocol?
    var router: ManageBankWireframeProtocol?
    weak var view: ManageBankViewProtocol?
}
