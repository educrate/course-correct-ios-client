//
//  TutorListProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol TutorListDelegate: class {
    func didSelectTutor(_ tutor: String)
}

// MARK: - Wireframe
protocol TutorListWireframeProtocol: class {
    func presentTutorProfile(_ delegate: TutorProfileDelegate?)
}

// MARK: - Presenter
protocol TutorListPresenterProtocol: class {
    var router: TutorListWireframeProtocol? { get set }
    var interactor: TutorListInteractorProtocol? { get set }
    var view: TutorListViewProtocol? { get set }
    var delegate: TutorListDelegate? { get set }
    
    func showTutorProfile(at indexPath: IndexPath, _ delegate: TutorProfileDelegate?)
    func didSelectTutor(_ tutor: String)
}

// MARK: - Interactor
protocol TutorListInteractorProtocol: class {
  var presenter: TutorListPresenterProtocol? { get set }
}

// MARK: - View 
protocol TutorListViewProtocol: TutorProfileDelegate {
  var presenter: TutorListPresenterProtocol? { get set }
}
