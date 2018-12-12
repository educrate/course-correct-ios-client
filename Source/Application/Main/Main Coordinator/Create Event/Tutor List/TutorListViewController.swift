//
//  TutorListViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorListViewController: UIViewController, TutorListViewProtocol {
    
    // MARK: - Properties
	var presenter: TutorListPresenterProtocol?
    
    // MARK: - Views
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Deinitializer Verification
    deinit {
        print("deinitialized select tutor screen")
    }
}

// MARK: - Table View Delegate Conformation
extension TutorListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showTutorProfile(at: indexPath, self)
    }
}

// MARK: - Intermodule Communicator
extension TutorListViewController {
    func didSelect(_ tutor: String) {
        presenter?.didSelectTutor(tutor)
    }
}

// MARK: - Table View Data Source Conformation
extension TutorListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(for: indexPath) as TutorListCell
    }
}
