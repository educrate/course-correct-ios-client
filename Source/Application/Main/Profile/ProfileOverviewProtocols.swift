//
//  ProfileOverviewProtocols.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation


// MARK: - Wireframe

protocol ProfileOverviewWireframeProtocol: class, Wireframe {
    func presentAccount()
    func presentPayment()
    func presentSupport()
    func presentWelcome()
}


// MARK: - Presenter

protocol ProfileOverviewPresenterProtocol: class {
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
