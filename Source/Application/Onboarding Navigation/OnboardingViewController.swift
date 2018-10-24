//
//  OnboardingViewController.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

protocol OnboardingViewControllerDelegate: class {
    func onboardingViewController(_ onboardingViewController: OnboardingViewController, didFinishWith state: String)
}

class OnboardingViewController: UINavigationController, OnboardingViewProtocol {
    
    // MARK: Viper
	var presenter: OnboardingPresenterProtocol?
    weak var onboardingDelegate: OnboardingViewControllerDelegate?
}

extension OnboardingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.presenter?.start()
        }
    }
}
