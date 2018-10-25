//
//  ProfileOverviewPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileOverviewPresenter: ProfileOverviewPresenterProtocol {
    weak private var view: ProfileOverviewViewProtocol?
    var interactor: ProfileOverviewInteractorProtocol?
    private let router: ProfileOverviewWireframeProtocol

    init(interface: ProfileOverviewViewProtocol,
         interactor: ProfileOverviewInteractorProtocol?,
         router: ProfileOverviewWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension ProfileOverviewPresenter {
    func showAccountScreen() {
        interactor?.fetchAccountInformation()
    }
    
    func showPaymentScreen() {
        interactor?.fetchPaymentInformation()
    }
    
    func showSupportScreen() {
        interactor?.fetchSupportInformation()
    }
    
    func logoutProfile() {
        interactor?.logoutProfile()
    }
    
    func accountInformationFetched(with result: Result<Void, ProfileOverviewError>) {
        switch result {
        case .success:
            router.presentAccount()
        case .failure(let error):
            view?.show(error: error)
        }
    }
    
    func paymentInformationFetched(with result: Result<Void, ProfileOverviewError>) {
        switch result {
        case .success:
            router.presentPayment()
        case .failure(let error):
            view?.show(error: error)
        }
    }
    
    func supportInformationFetched(with result: Result<Void, ProfileOverviewError>) {
        switch result {
        case .success:
            router.presentSupport()
        case .failure(let error):
            view?.show(error: error)
        }
    }
    
    func logoutProfileFetched(with result: Result<Void, ProfileOverviewError>) {
        switch result {
        case .success:
            router.presentSupport()
        case .failure(let error):
            view?.show(error: error)
        }
    }
}
