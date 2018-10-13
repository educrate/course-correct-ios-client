//
//  EnterStudentIdentifierProtocols.swift
//  Client
//
//  Created Ampe on 10/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol EnterStudentIdentifierWireframeProtocol: class, ModuleWireframeable {
    func presentEnterAccessCode()
}


// MARK: - Presenter

protocol EnterStudentIdentifierPresenterProtocol: class {
    func studentIdentifierEntered(with value: String)
    
    func studentIdentifierValidated(for identifier: String, with result: Result<Void, EnterStudentIdentifierError>)
}


// MARK: - Interactor

protocol EnterStudentIdentifierInteractorProtocol: class {
  var presenter: EnterStudentIdentifierPresenterProtocol?  { get set }
    
    func validateStudentIdentifier()
}


// MARK: - View 

protocol EnterStudentIdentifierViewProtocol: class {
  var presenter: EnterStudentIdentifierPresenterProtocol?  { get set }
    
    func show(error: EnterStudentIdentifierError)
}
