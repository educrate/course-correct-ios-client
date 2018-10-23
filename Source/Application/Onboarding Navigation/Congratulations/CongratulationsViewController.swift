//
//  CongratulationsViewController.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

protocol CongratulationsViewControllerDelegate: class {
    func congratulationsViewController(_ congratulationsViewController: CongratulationsViewController, didDisplayWith state: String)
}

class CongratulationsViewController: UIViewController, CongratulationsViewProtocol {
    
    // MARK: Viper
	var presenter: CongratulationsPresenterProtocol?
}
