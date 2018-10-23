//
//  OnboardingViewController.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class OnboardingViewController: UINavigationController, OnboardingViewProtocol {
	var presenter: OnboardingPresenterProtocol?
}

extension OnboardingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.presenter?.start()
        }
    }
}
