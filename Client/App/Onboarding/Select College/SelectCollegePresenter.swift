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

    init(interface: SelectCollegeViewProtocol, interactor: SelectCollegeInteractorProtocol?, router: SelectCollegeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension SelectCollegePresenter {
    func fetchedColleges(for input: String, with result: Result<[String], SelectCollegeError>) {
        <#code#>
    }
}
