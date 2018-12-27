//
//  ProfileSupportProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Wireframe
protocol ProfileSupportWireframeProtocol: class {}

// MARK: - Presenter
protocol ProfileSupportPresenterProtocol: class {
    var router: ProfileSupportWireframeProtocol? { get set }
    var interactor: ProfileSupportInteractorProtocol? { get set }
    var view: ProfileSupportViewProtocol? { get set }
}

// MARK: - Interactor
protocol ProfileSupportInteractorProtocol: class {
  var presenter: ProfileSupportPresenterProtocol? { get set }
}

// MARK: - View
protocol ProfileSupportViewProtocol: class {
  var presenter: ProfileSupportPresenterProtocol? { get set }
}
