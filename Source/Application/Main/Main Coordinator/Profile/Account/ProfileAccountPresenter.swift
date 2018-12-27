//
//  ProfileAccountPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileAccountPresenter: ProfileAccountPresenterProtocol {
    var interactor: ProfileAccountInteractorProtocol?
    var router: ProfileAccountWireframeProtocol?
    weak var view: ProfileAccountViewProtocol?
}
