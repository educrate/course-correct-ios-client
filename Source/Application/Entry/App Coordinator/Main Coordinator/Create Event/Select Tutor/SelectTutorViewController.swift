//
//  SelectTutorViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectTutorViewController: UIViewController, SelectTutorViewProtocol {
    
    // MARK: Viper
	var presenter: SelectTutorPresenterProtocol?
    
    // MARK: Views
    @IBOutlet private weak var tableView: UITableView!
    
    deinit {
        print("deinitialized select tutor screen")
    }
}

// MARK: - Controller Lifecycle
extension SelectTutorViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectedTutor(at: indexPath)
    }
}

extension SelectTutorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SelectTutorCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
}
