//
//  TutorProfileProtocols.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol TutorProfileWireframeProtocol: class {}


// MARK: - Presenter

protocol TutorProfilePresenterProtocol: class {}


// MARK: - Interactor

protocol TutorProfileInteractorProtocol: class {
  var presenter: TutorProfilePresenterProtocol?  { get set }
}


// MARK: - View 

protocol TutorProfileViewProtocol: class {
  var presenter: TutorProfilePresenterProtocol?  { get set }
}
