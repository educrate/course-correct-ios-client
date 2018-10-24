//
//  WalkthroughViewController.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

protocol WalkthroughViewControllerDelegate: class {
    func walkthroughViewController(_ walkthroughViewController: WalkthroughViewController, didCompleteWith state: String)
}

class WalkthroughViewController: UIViewController, WalkthroughViewProtocol {
    
    // MARK: Viper
	var presenter: WalkthroughPresenterProtocol?
    weak var delegate: WalkthroughViewControllerDelegate?
}
