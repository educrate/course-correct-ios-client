//
//  AppInteractor.swift
//  Client
//
//  Created Ampe on 10/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppInteractor: AppInteractorProtocol {
    weak var presenter: AppPresenterProtocol?
}

extension AppInteractor {
    func determineInitialView() {
        presenter?.showOnboarding()
    }
}
