//
//  ProfilePaymentProtocols.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol ProfilePaymentWireframeProtocol: class {}


// MARK: - Presenter

protocol ProfilePaymentPresenterProtocol: class {}


// MARK: - Interactor

protocol ProfilePaymentInteractorProtocol: class {
  var presenter: ProfilePaymentPresenterProtocol?  { get set }
}


// MARK: - View 

protocol ProfilePaymentViewProtocol: class {
  var presenter: ProfilePaymentPresenterProtocol?  { get set }
}
