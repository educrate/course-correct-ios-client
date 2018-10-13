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

protocol EnterStudentIdentifierPresenterProtocol: class {}


// MARK: - Interactor

protocol EnterStudentIdentifierInteractorProtocol: class {
  var presenter: EnterStudentIdentifierPresenterProtocol?  { get set }
}


// MARK: - View 

protocol EnterStudentIdentifierViewProtocol: class {
  var presenter: EnterStudentIdentifierPresenterProtocol?  { get set }
}
