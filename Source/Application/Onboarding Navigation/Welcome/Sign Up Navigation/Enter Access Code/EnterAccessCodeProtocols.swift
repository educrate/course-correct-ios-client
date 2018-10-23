//
//  EnterAccessCodeProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol EnterAccessCodeWireframeProtocol: class, Wireframe {
    func presentCreatePassword()
}


// MARK: - Presenter

protocol EnterAccessCodePresenterProtocol: class {
    func accessCodeEntered(with value: String)
    
    func accessCodeValidated(for code: String, with result: Result<Void, EnterAccessCodeError>)
}


// MARK: - Interactor

protocol EnterAccessCodeInteractorProtocol: class {
  var presenter: EnterAccessCodePresenterProtocol? { get set }
    
    func validate(_ accessCode: String)
}


// MARK: - View 

protocol EnterAccessCodeViewProtocol: class {
  var presenter: EnterAccessCodePresenterProtocol? { get set }
    
    func show(error: EnterAccessCodeError)
}
