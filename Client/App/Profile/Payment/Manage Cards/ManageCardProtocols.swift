//
//  ManageCardProtocols.swift
//  Client
//
//  Created Ampe on 10/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol ManageCardWireframeProtocol: class {}


// MARK: - Presenter

protocol ManageCardPresenterProtocol: class {}


// MARK: - Interactor

protocol ManageCardInteractorProtocol: class {
  var presenter: ManageCardPresenterProtocol?  { get set }
}


// MARK: - View 

protocol ManageCardViewProtocol: class {
  var presenter: ManageCardPresenterProtocol?  { get set }
}
