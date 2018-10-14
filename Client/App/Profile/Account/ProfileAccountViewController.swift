//
//  ProfileAccountViewController.swift
//  Client
//
//  Created Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileAccountViewController: UIViewController, ProfileAccountViewProtocol {
	var presenter: ProfileAccountPresenterProtocol?
    
    @IBOutlet private weak var coursePicker: UIInlinePickerViewController!
}

extension ProfileAccountViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coursePicker.setOptions(["Physics 7C", "Chemistry 1B", "Math 3D", "Python 101"])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueCase(for: segue) {
        case .inlinePicker:
            coursePicker = segue.viewController()
        }
    }
}

extension ProfileAccountViewController: SegueIdentifiable {
    enum Segue: String {
        case inlinePicker = "inlinepicker"
    }
}
