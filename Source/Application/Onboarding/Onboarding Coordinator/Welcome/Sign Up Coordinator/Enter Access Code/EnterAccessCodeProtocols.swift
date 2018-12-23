//
//  EnterAccessCodeProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol EnterAccessCodeDelegate: class {
    func enterAccessCode(didEnter accessCode: String)
}

// MARK: - Wireframe
protocol EnterAccessCodeWireframeProtocol: class {
}

// MARK: - Presenter
protocol EnterAccessCodePresenterProtocol: class {
    var router: EnterAccessCodeWireframeProtocol? { get set }
    var interactor: EnterAccessCodeInteractorProtocol? { get set }
    var view: EnterAccessCodeViewProtocol? { get set }
    var delegate: EnterAccessCodeDelegate? { get set }
    
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
    
    func show(errorMessage: String)
}
