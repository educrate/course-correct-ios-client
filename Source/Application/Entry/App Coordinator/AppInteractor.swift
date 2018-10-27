//
//  AppInteractor.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class AppInteractor: AppInteractorProtocol {
    weak var presenter: AppPresenterProtocol?
}

extension AppInteractor {
    func determineLaunchState() {
        let userState: AppUserState = arc4random() % 2 == 0 ? .authenticated : .unauthenticated
        presenter?.launchStateDetermined(userState)
    }
}
