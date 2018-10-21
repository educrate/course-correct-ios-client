//
//  OnboardingProtocols.swift
//  Client
//
//  Created Ampe on 10/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol OnboardingWireframeProtocol: class {}


// MARK: - Presenter

protocol OnboardingPresenterProtocol: class {}


// MARK: - Interactor

protocol OnboardingInteractorProtocol: class {
  var presenter: OnboardingPresenterProtocol?  { get set }
}


// MARK: - View 

protocol OnboardingViewProtocol: class {
  var presenter: OnboardingPresenterProtocol?  { get set }
}
