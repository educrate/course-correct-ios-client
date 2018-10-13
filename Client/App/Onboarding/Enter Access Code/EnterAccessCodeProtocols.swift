//
//  EnterAccessCodeProtocols.swift
//  Client
//
//  Created Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol EnterAccessCodeWireframeProtocol: class, ModuleWireframeable {
    func presentCreatePassword()
}


// MARK: - Presenter

protocol EnterAccessCodePresenterProtocol: class {}


// MARK: - Interactor

protocol EnterAccessCodeInteractorProtocol: class {
  var presenter: EnterAccessCodePresenterProtocol?  { get set }
}


// MARK: - View 

protocol EnterAccessCodeViewProtocol: class {
  var presenter: EnterAccessCodePresenterProtocol?  { get set }
}
