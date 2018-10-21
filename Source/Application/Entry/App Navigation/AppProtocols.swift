//
//  AppProtocols.swift
//  Client
//
//  Created Ampe on 10/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol AppWireframeProtocol: class {
    func presentOnboarding()
    func presentSchedule()
}


// MARK: - Presenter

protocol AppPresenterProtocol: class {
    func setInitialView()
    
    func showOnboarding()
    func showSchedule()
}


// MARK: - Interactor

protocol AppInteractorProtocol: class {
    var presenter: AppPresenterProtocol?  { get set }
    
    func determineInitialView()
}


// MARK: - View 

protocol AppViewProtocol: class {
    var presenter: AppPresenterProtocol?  { get set }
}
