//
//  OnboardingViewController.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class OnboardingViewController: UINavigationController, OnboardingViewProtocol {
    
    // MARK: Viper
	var presenter: OnboardingPresenterProtocol?
    
    // MARK: Deinit Verification
    deinit {
        print("deinitialized onboarding module")
    }
}

extension OnboardingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.makeTransparent()
        DispatchQueue.main.async { [weak self] in
            self?.presenter?.start()
        }
    }
}
