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
    func presentOnboardingModule()
    func presentMainModule()
}


// MARK: - Presenter

protocol AppPresenterProtocol: Coordinator, OnboardingPresenterDelegate, MainPresenterDelegate {
    func launchStateDetermined(_ state: String)
}


// MARK: - Interactor

protocol AppInteractorProtocol: class {
  var presenter: AppPresenterProtocol?  { get set }
    
    func determineLaunchState()
}


// MARK: - View 

protocol AppViewProtocol: class {
  var presenter: AppPresenterProtocol?  { get set }
}
