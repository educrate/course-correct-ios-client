//
//  SelectCollegePresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectCollegePresenter: SelectCollegePresenterProtocol {
    
    // MARK: Viper
    weak private var view: SelectCollegeViewProtocol?
    var interactor: SelectCollegeInteractorProtocol?
    private let router: SelectCollegeWireframeProtocol

    init(interface: SelectCollegeViewProtocol,
         interactor: SelectCollegeInteractorProtocol?,
         router: SelectCollegeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension SelectCollegePresenter {
    func updateView(for input: String?) {
        guard let input = input else {
            return
        }
        
        interactor?.fetchColleges(for: input)
    }
    
    func collegesFetched(for input: String, with result: Result<[String], SelectCollegeError>) {
        switch result {
        case .failure(let error):
            view?.show(errorMessage: error.message)
        case .success(let colleges):
            view?.show(names: colleges)
        }
    }
    
    func selected(college identifier: String) {
        interactor?.validate(college: identifier)
    }
    
    func collegeValidated(for identifier: String, with result: Result<Void, SelectCollegeError>) {
        switch result {
        case .success:
            router.showNextScreen()
        case .failure(let error):
            view?.show(errorMessage: error.message)
        }
    }
}
