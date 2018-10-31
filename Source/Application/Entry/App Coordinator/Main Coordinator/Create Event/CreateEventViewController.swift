//
//  CreateEventViewController.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreateEventViewController: UITableViewController, CreateEventViewProtocol {
	var presenter: CreateEventPresenterProtocol?
    
    deinit {
        print("deinitialized create event screen")
    }
}

extension CreateEventViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
