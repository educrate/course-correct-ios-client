//
//  ProfileAccountViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileAccountViewController: UIViewController, ProfileAccountViewProtocol {
	var presenter: ProfileAccountPresenterProtocol?
    
    @IBOutlet private weak var coursePicker: UIInlinePickerViewController!
    @IBOutlet private weak var coursePickerHeight: NSLayoutConstraint!
    
    deinit {
        print("deinitialized profile account screen")
    }
}

extension ProfileAccountViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set(options: ["Physics 7C",
                      "Chemistry 1A",
                      "Math 3D",
                      "Python 101",
                      "Psychology 12C",
                      "Java 13B",
                      "Biology 93"])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueCase(for: segue) {
        case .inlinePicker:
            coursePicker = segue.viewController()
        }
    }
}

private extension ProfileAccountViewController {
    func set(options: [String]) {
        coursePicker.setOptions(options)
        updateCoursePickerHeight()
    }
    
    func updateCoursePickerHeight() {
        DispatchQueue.main.async {
            self.coursePickerHeight.constant = self.coursePicker.recommendedHeight
        }
    }
}

extension ProfileAccountViewController: SegueIdentifiable {
    enum Segue: String {
        case inlinePicker = "inlinepicker"
    }
}
