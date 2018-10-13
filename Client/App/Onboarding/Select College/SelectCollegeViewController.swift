//
//  SelectCollegeViewController.swift
//  Client
//
//  Created Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectCollegeViewController: UIViewController {
    
    // MARK: Viper
    var presenter: SelectCollegePresenterProtocol?
    
    // MARK: Views
    @IBOutlet private weak var collegeSelector: UIDropdownViewController!
}

extension SelectCollegeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeSelector.setPlaceholder("Name of University")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collegeSelector.beginEditing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dropdownViewController: UIDropdownViewController = segue.viewController()
        collegeSelector = dropdownViewController
        collegeSelector.delegate = self
    }
}

// MARK: - Viper Methods
extension SelectCollegeViewController: SelectCollegeViewProtocol {
    func show(names: [String]) {
        collegeSelector.setDropdown(names)
    }
    
    func show(error: SelectCollegeError) {
        
    }
}

// MARK: - Dropdown Data Source & Delegate Conformance
extension SelectCollegeViewController: UIDropdownDelegate {
    var cellHeight: CGFloat {
        return 50
    }
    
    func inputChanged(_ sender: UITextField) {
        presenter?.updateView(for: sender.text)
    }
    
    func dropdown(_ dropdown: UITableView, didSelectRowAt indexPath: IndexPath) {
        collegeSelector.endEditing()
        presenter?.showEnterStudentIdentifier()
    }
}
