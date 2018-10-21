//
//  OnboardingNavigationController.swift
//  Client
//
//  Created by Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class OnboardingNavigationController: UINavigationController, OnboardingViewProtocol {
    var presenter: OnboardingPresenterProtocol?
}

extension OnboardingNavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
}

extension OnboardingNavigationController {
    func style() {
        navigationBar.makeTransparent()
    }
}
