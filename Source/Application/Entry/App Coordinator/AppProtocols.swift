//
//  AppProtocols.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Wireframe
protocol AppWireframeProtocol: OnboardingDelegate, MainDelegate {
    func presentOnboardingModule()
    func presentMainModule()
}

// MARK: - Presenter
protocol AppPresenterProtocol: class {
    func launchStateDetermined(_ state: AppUserState)
    func start()
}

// MARK: - Interactor
protocol AppInteractorProtocol: class {
    var presenter: AppPresenterProtocol?  { get set }
    
    func determineLaunchState()
}

// MARK: - View
protocol AppViewProtocol: class {
    var presenter: AppPresenterProtocol? { get set }
}
