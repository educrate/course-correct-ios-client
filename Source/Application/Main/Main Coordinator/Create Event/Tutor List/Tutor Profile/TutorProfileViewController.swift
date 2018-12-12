//
//  TutorProfileViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorProfileViewController: UIViewController, TutorProfileViewProtocol {
	var presenter: TutorProfilePresenterProtocol?
    
    deinit {
        print("deinitialized tutor profile screen")
    }
}

private extension TutorProfileViewController {
    @IBAction func didPressDone(_ sender: UIBarButtonItem) {
        presenter?.tutorSelected("Christian Ampe")
    }
}

// MARK: - Table View Data Source Conformation
extension TutorProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(for: indexPath) as TutorProfileReviewCell
    }
}
