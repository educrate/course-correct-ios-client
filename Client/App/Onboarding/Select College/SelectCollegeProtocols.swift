//
//  SelectCollegeProtocols.swift
//  Client
//
//  Created Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol SelectCollegeWireframeProtocol: class, ModuleWireframeable {}


// MARK: - Presenter

protocol SelectCollegePresenterProtocol: class {
    
    
    // MARK: - From View Methods
    func fetchColleges(for input: String) -> Result<[String], SelectCollegeError>
    
    // MARK: - To View Methods
    func fetchedColleges(for input: String, with result: Result<[String], SelectCollegeError>)
}


// MARK: - Interactor

protocol SelectCollegeInteractorProtocol: class {
    
    // MARK: - Properties
    var presenter: SelectCollegePresenterProtocol?  { get set }
    
    
    // MARK: - Methods
    func fetchColleges(for input: String) -> Result<[String], SelectCollegeError>
}


// MARK: - View 

protocol SelectCollegeViewProtocol: class {
  var presenter: SelectCollegePresenterProtocol?  { get set }
}
