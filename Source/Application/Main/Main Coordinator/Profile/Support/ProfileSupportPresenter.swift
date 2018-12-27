//
//  ProfileSupportPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileSupportPresenter: ProfileSupportPresenterProtocol {
    var interactor: ProfileSupportInteractorProtocol?
    var router: ProfileSupportWireframeProtocol?
    weak var view: ProfileSupportViewProtocol?
}
