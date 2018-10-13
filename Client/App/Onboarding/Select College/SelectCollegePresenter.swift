//
//  SelectCollegePresenter.swift
//  Client
//
//  Created Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectCollegePresenter: SelectCollegePresenterProtocol {
    
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
    
    func collegesFetched(for input: String,
                         with result: Result<[String], SelectCollegeError>) {
        switch result {
        case .failure(let error):
            view?.show(error: error)
        case .success(let colleges):
            view?.show(names: colleges)
        }
    }
}

extension SelectCollegePresenter {
    func showEnterStudentIdentifier() {
        router.presentEnterStudentIdentifier()
    }
}
