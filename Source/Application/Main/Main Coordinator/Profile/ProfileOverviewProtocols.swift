//
//  ProfileOverviewProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Intermodule Communicator
protocol ProfileOverviewDelegate: class {
    func profileOverviewRouter(_ profileOverviewRouter: ProfileOverviewRouter, didSignOut user: String)
}

// MARK: - Wireframe
protocol ProfileOverviewWireframeProtocol: class {
    func presentAccount()
    func presentPayment()
    func presentSupport()
    func presentLogout()
}

// MARK: - Presenter
protocol ProfileOverviewPresenterProtocol: class {
    var router: ProfileOverviewWireframeProtocol? { get set }
    var interactor: ProfileOverviewInteractorProtocol? { get set }
    var view: ProfileOverviewViewProtocol? { get set }
    var delegate: ProfileOverviewDelegate? { get set }
    
    func showAccountScreen()
    func showPaymentScreen()
    func showSupportScreen()
    func logoutProfile()
    
    func accountInformationFetched(with result: Result<Void, ProfileOverviewError>)
    func paymentInformationFetched(with result: Result<Void, ProfileOverviewError>)
    func supportInformationFetched(with result: Result<Void, ProfileOverviewError>)
    func logoutProfileFetched(with result: Result<Void, ProfileOverviewError>)
}

// MARK: - Interactor
protocol ProfileOverviewInteractorProtocol: class {
    var presenter: ProfileOverviewPresenterProtocol? { get set }
    
    func fetchAccountInformation()
    func fetchPaymentInformation()
    func fetchSupportInformation()
    func logoutProfile()
}

// MARK: - View
protocol ProfileOverviewViewProtocol: class {
    var presenter: ProfileOverviewPresenterProtocol? { get set }
    
    func show(error: ProfileOverviewError)
}
