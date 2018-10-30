//
//  SelectCollegeProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe
protocol SelectCollegeWireframeProtocol: class {
    func showNextScreen()
}


// MARK: - Coordinator
protocol SelectCollegeRouterDelegate: class {
    func selectCollege(didSelect college: String)
}


// MARK: - Presenter
protocol SelectCollegePresenterProtocol: class {
    
    // MARK: From View
    func updateView(for input: String?)
    func selected(college identifier: String)
    
    
    // MARK: To View
    func collegesFetched(for input: String, with result: Result<[String], SelectCollegeError>)
    func collegeValidated(for identifier: String, with result: Result<Void, SelectCollegeError>)
}


// MARK: - Interactor
protocol SelectCollegeInteractorProtocol: class {
    
    // MARK: Properties
    var presenter: SelectCollegePresenterProtocol? { get set }
    
    // MARK: Methods
    func fetchColleges(for input: String)
    func validate(college identifier: String)
}


// MARK: - View 
protocol SelectCollegeViewProtocol: class {
    
    // MARK: Properties
    var presenter: SelectCollegePresenterProtocol? { get set }
    
    // MARK: Methods
    func show(names: [String])
    func show(errorMessage: String)
}
