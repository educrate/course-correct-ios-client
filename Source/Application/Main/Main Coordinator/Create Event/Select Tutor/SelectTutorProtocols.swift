//
//  SelectTutorProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol SelectTutorWireframeProtocol: class {
    func presentTutorProfile()
}


// MARK: - Presenter

protocol SelectTutorPresenterProtocol: class {
    func selectedTutor(at indexPath: IndexPath)
}


// MARK: - Interactor

protocol SelectTutorInteractorProtocol: class {
  var presenter: SelectTutorPresenterProtocol? { get set }
}


// MARK: - View 

protocol SelectTutorViewProtocol: class {
  var presenter: SelectTutorPresenterProtocol? { get set }
}
