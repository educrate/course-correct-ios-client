//
//  SelectCollegeInteractor.swift
//  Client
//
//  Created by Christian Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectCollegeInteractor: SelectCollegeInteractorProtocol {
    weak var presenter: SelectCollegePresenterProtocol?
}

extension SelectCollegeInteractor {
    func fetchColleges(for input: String) {
        guard !input.isEmpty else {
            return
        }
        
        guard input != "error" else {
            presenter?.collegesFetched(for: input, with: Result(error: .collegesNotLoaded))
            return
        }
        
        presenter?.collegesFetched(for: input, with: Result(value: ["UCI", "UCLA", "USC", "UCSD"]))
    }
    
    func validate(college identifier: String) {
        guard !identifier.isEmpty else {
            presenter?.collegeValidated(for: identifier, with: Result(error: .noCollegeSelected))
            return
        }
        
        guard identifier == "UCI" else {
            presenter?.collegeValidated(for: identifier, with: Result(error: .invalidCollege))
            return
        }
        
        presenter?.collegeValidated(for: identifier, with: Result(value: ()))
    }
}
