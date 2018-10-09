//
//  OnboardingProtocols.swift
//  Client
//
//  Created Ampe on 10/9/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol OnboardingWireframeProtocol: class {}


// MARK: - Presenter

protocol OnboardingPresenterProtocol: class {
    var interactor: OnboardingInteractorInputProtocol? { get set }
}


// MARK: - Interactor to Presenter

protocol OnboardingInteractorOutputProtocol: class {}


// MARK: - Interactor from Presenter

protocol OnboardingInteractorInputProtocol: class {
    var presenter: OnboardingInteractorOutputProtocol?  { get set }
}


// MARK: - View

protocol OnboardingViewProtocol: class {
    var presenter: OnboardingPresenterProtocol?  { get set }
}
