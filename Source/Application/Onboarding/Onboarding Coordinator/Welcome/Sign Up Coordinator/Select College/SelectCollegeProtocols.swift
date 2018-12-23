//
//  SelectCollegeProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol SelectCollegeDelegate: class {
    func selectCollege(didSelect college: String)
}

// MARK: - Wireframe
protocol SelectCollegeWireframeProtocol: class {
}

// MARK: - Presenter
protocol SelectCollegePresenterProtocol: class {
    var router: SelectCollegeWireframeProtocol? { get set }
    var interactor: SelectCollegeInteractorProtocol? { get set }
    var view: SelectCollegeViewProtocol? { get set }
    var delegate: SelectCollegeDelegate? { get set }
    
    func updateView(for input: String?)
    func selected(college identifier: String)
    func collegesFetched(for input: String, with result: Result<[String], SelectCollegeError>)
    func collegeValidated(for identifier: String, with result: Result<Void, SelectCollegeError>)
}

// MARK: - Interactor
protocol SelectCollegeInteractorProtocol: class {
    var presenter: SelectCollegePresenterProtocol? { get set }
    
    func fetchColleges(for input: String)
    func validate(college identifier: String)
}

// MARK: - View 
protocol SelectCollegeViewProtocol: class {
    var presenter: SelectCollegePresenterProtocol? { get set }
    
    func show(names: [String])
    func show(errorMessage: String)
}
