//
//  EnterStudentIdentifierProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol EnterStudentIdentifierDelegate: class {
    func enterStudentIdentifier(didEnter studentIdentifier: String)
}

// MARK: - Wireframe
protocol EnterStudentIdentifierWireframeProtocol: class {
}

// MARK: - Presenter
protocol EnterStudentIdentifierPresenterProtocol: class {
    var router: EnterStudentIdentifierWireframeProtocol? { get set }
    var interactor: EnterStudentIdentifierInteractorProtocol? { get set }
    var view: EnterStudentIdentifierViewProtocol? { get set }
    var delegate: EnterStudentIdentifierDelegate? { get set }
    
    func studentIdentifierEntered(with value: String)
    func studentIdentifierValidated(for identifier: String, with result: Result<Void, EnterStudentIdentifierError>)
}

// MARK: - Interactor
protocol EnterStudentIdentifierInteractorProtocol: class {
  var presenter: EnterStudentIdentifierPresenterProtocol? { get set }
    
    func validate(studentIdentifier: String)
}

// MARK: - View 
protocol EnterStudentIdentifierViewProtocol: class {
  var presenter: EnterStudentIdentifierPresenterProtocol? { get set }
    
    func show(errorMessage: String)
}
