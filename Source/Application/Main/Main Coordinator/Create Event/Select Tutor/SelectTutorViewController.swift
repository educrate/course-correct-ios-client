//
//  SelectTutorViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectTutorViewController: UIViewController, SelectTutorViewProtocol {
    
    // MARK: - Viper
	var presenter: SelectTutorPresenterProtocol?
    
    // MARK: - Views
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Deinitializer Verification
    deinit {
        print("deinitialized select tutor screen")
    }
}

// MARK: - Table View Delegate Conformation
extension SelectTutorViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectedTutor(at: indexPath)
    }
}

// MARK: - Table View Data Source Conformation
extension SelectTutorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(for: indexPath) as SelectTutorCell
    }
}
