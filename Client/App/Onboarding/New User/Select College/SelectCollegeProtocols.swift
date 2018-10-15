//
//  SelectCollegeProtocols.swift
//  Client
//
//  Created Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol SelectCollegeWireframeProtocol: class, ModuleWireframeable {
    func presentEnterStudentIdentifier()
}


// MARK: - Presenter

protocol SelectCollegePresenterProtocol: class {
    
    
    // MARK: - From View
    
    // MARK: Update Methods
    func updateView(for input: String?)
    
    // MARK: Routing Methods
    func showEnterStudentIdentifier()
    
    
    // MARK: - To View
    
    // MARK: Update Methods
    func collegesFetched(for input: String, with result: Result<[String], SelectCollegeError>)
}


// MARK: - Interactor

protocol SelectCollegeInteractorProtocol: class {
    
    // MARK: Properties
    var presenter: SelectCollegePresenterProtocol? { get set }
    
    // MARK: Methods
    func fetchColleges(for input: String)
}


// MARK: - View 

protocol SelectCollegeViewProtocol: class {
    
    // MARK: Properties
    var presenter: SelectCollegePresenterProtocol? { get set }
    
    // MARK: Methods
    func show(names: [String])
    func show(error: SelectCollegeError)
}
