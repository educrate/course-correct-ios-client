//
//  SelectCollegeViewController.swift
//  Client
//
//  Created Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectCollegeViewController: UIViewController {
    
    // MARK: Properties
    var data: [[String]] = [[]]
    
    
    // MARK: Viper
    var presenter: SelectCollegePresenterProtocol?
    
    // MARK: Views
    @IBOutlet
    private weak var collegeSelector: UIDropdownView!
}

extension SelectCollegeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeSelector.delegate = self
        collegeSelector.dataSource = self
    }
}

// MARK: - Viper Methods
extension SelectCollegeViewController: SelectCollegeViewProtocol {
    func show(names: [String]) {
        data[0] = names
        collegeSelector.reloadView()
    }
    
    func show(error: SelectCollegeError) {
        
    }
}

// MARK: - Dropdown Data Source & Delegate Conformance
extension SelectCollegeViewController: UIDropdownDataSource, UIDropdownDelegate {
    func textDidChange(_ sender: UIField) {
        presenter?.updateView(for: sender.text)
    }
}
