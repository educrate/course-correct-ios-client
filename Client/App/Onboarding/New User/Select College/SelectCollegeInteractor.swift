//
//  SelectCollegeInteractor.swift
//  Client
//
//  Created Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectCollegeInteractor: SelectCollegeInteractorProtocol {
    weak var presenter: SelectCollegePresenterProtocol?
}

extension SelectCollegeInteractor {
    func fetchColleges(for input: String) {
        presenter?.collegesFetched(for: input, with: Result(value: ["UCI", "UCLA", "USC", "UCSD"]))
    }
}
