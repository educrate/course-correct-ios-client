//
//  ProfilePaymentProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol ProfilePaymentWireframeProtocol: class {
    func presentAddCard()
    func presentAddBank()
}


// MARK: - Presenter

protocol ProfilePaymentPresenterProtocol: class {
    func showAddCard()
    func showAddBank()
}


// MARK: - Interactor

protocol ProfilePaymentInteractorProtocol: class {
  var presenter: ProfilePaymentPresenterProtocol? { get set }
}


// MARK: - View 

protocol ProfilePaymentViewProtocol: class {
  var presenter: ProfilePaymentPresenterProtocol? { get set }
}
