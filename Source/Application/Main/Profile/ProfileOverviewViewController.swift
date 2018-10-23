//
//  ProfileOverviewViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileOverviewViewController: UIViewController, ProfileOverviewViewProtocol {
	var presenter: ProfileOverviewPresenterProtocol?
    
    // MARK: Views
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var majorLabel: UILabel!
    @IBOutlet private weak var gradeLabel: UILabel!
}

private extension ProfileOverviewViewController {
    @IBAction func accountPressed(_ sender: UIButton, forEvent event: UIEvent) {
        presenter?.showAccountScreen()
    }
    
    @IBAction func paymentPressed(_ sender: UIButton, forEvent event: UIEvent) {
        presenter?.showPaymentScreen()
    }
    
    @IBAction func supportPressed(_ sender: UIButton, forEvent event: UIEvent) {
        presenter?.showSupportScreen()
    }
    
    @IBAction func logOutPressed(_ sender: UIButton, forEvent event: UIEvent) {
        presenter?.logoutProfile()
    }
}

extension ProfileOverviewViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.round()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension ProfileOverviewViewController {
    func show(error: ProfileOverviewError) {
        
    }
}
