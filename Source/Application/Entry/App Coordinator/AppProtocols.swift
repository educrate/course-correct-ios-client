//
//  AppProtocols.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Wireframe
protocol AppWireframeProtocol: class {
    func presentOnboarding(_ delegate: OnboardingDelegate?)
    func presentMain(_ delegate: MainDelegate?)
}

// MARK: - Presenter
protocol AppPresenterProtocol: OnboardingDelegate, MainDelegate {
    var router: AppWireframeProtocol? { get set }
    var interactor: AppInteractorProtocol? { get set }
    var view: AppViewProtocol? { get set }
    
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
