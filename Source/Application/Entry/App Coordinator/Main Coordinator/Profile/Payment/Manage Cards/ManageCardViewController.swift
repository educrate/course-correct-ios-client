//
//  ManageCardViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/19/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ManageCardViewController: UIViewController, ManageCardViewProtocol {
	
    // MARK: Viper
    var presenter: ManageCardPresenterProtocol?
    
    // MARK: Outlets
    @IBOutlet private weak var cardTableView: UITableView!
    
    deinit {
        print("deinitialized manage card screen")
    }
}

extension ManageCardViewController: UITableViewDelegate {}

extension ManageCardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ManageCardCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setUp()
        return cell
    }
}
