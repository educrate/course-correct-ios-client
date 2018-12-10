//
//  ProfileOverviewInteractor.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileOverviewInteractor: ProfileOverviewInteractorProtocol {
    weak var presenter: ProfileOverviewPresenterProtocol?
}

extension ProfileOverviewInteractor {
    func fetchAccountInformation() {
        presenter?.accountInformationFetched(with: Result(value: ()))
    }
    
    func fetchPaymentInformation() {
        presenter?.paymentInformationFetched(with: Result(value: ()))
    }
    
    func fetchSupportInformation() {
        presenter?.supportInformationFetched(with: Result(value: ()))
    }
    
    func logoutProfile() {
        presenter?.logoutProfileFetched(with: Result(value: ()))
    }
}
