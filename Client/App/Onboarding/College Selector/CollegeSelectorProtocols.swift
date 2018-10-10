//
//  CollegeSelectorProtocols.swift
//  Client
//
//  Created Ampe on 10/9/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol CollegeSelectorWireframeProtocol: class {}


// MARK: - Presenter

protocol CollegeSelectorPresenterProtocol: class {
    var interactor: CollegeSelectorInteractorInputProtocol? { get set }
}


// MARK: - Interactor to Presenter

protocol CollegeSelectorInteractorOutputProtocol: class {}


// MARK: - Interactor from Presenter

protocol CollegeSelectorInteractorInputProtocol: class {
    var presenter: CollegeSelectorInteractorOutputProtocol?  { get set }
}


// MARK: - View

protocol CollegeSelectorViewProtocol: class {
    var presenter: CollegeSelectorPresenterProtocol?  { get set }
}
