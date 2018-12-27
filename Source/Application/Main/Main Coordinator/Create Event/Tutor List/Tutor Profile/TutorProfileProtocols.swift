//
//  TutorProfileProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: Intermodule Communicator
protocol TutorProfileDelegate: class {
    func didSelect(_ tutor: String)
}

// MARK: - Wireframe
protocol TutorProfileWireframeProtocol: class {
    func completed(with tutor: String)
}

// MARK: - Presenter
protocol TutorProfilePresenterProtocol: class {
    var router: TutorProfileWireframeProtocol? { get set }
    var interactor: TutorProfileInteractorProtocol? { get set }
    var view: TutorProfileViewProtocol? { get set }
    var delegate: TutorProfileDelegate? { get set }
    
    func tutorSelected(_ tutor: String)
}

// MARK: - Interactor
protocol TutorProfileInteractorProtocol: class {
  var presenter: TutorProfilePresenterProtocol? { get set }
}

// MARK: - View 
protocol TutorProfileViewProtocol: class {
  var presenter: TutorProfilePresenterProtocol? { get set }
}
