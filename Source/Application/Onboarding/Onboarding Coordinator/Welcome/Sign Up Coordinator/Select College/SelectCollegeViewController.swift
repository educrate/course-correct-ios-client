//
//  SelectCollegeViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SelectCollegeViewController: UIViewController {
    
    // MARK: Viper
    var presenter: SelectCollegePresenterProtocol?
    
    // MARK: Views
    @IBOutlet weak var collegeSelector: UIDropDownView! {
        didSet {
            collegeSelector.delegate = self
            collegeSelector.set(UIDropDownViewConfiguration(placeholder: "Name of University"))
        }
    }
    
    // MARK: Deinit Verification
    deinit {
        print("deinitialized select college screen")
    }
}

private extension SelectCollegeViewController {
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        presenter?.selected(college: collegeSelector.selection)
    }
}

extension SelectCollegeViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collegeSelector.beginEditing()
    }
}

// MARK: - Viper Methods
extension SelectCollegeViewController: SelectCollegeViewProtocol {
    func show(names: [String]) {
        collegeSelector.set(names)
        collegeSelector.reload()
    }
    
    func show(errorMessage: String) {
        UINotificationView.show(with: errorMessage)
    }
}

// MARK: - Dropdown Data Source & Delegate Conformance
extension SelectCollegeViewController: UIDropDownViewDelegate {
    func inputChanged(_ sender: UITextField) {
        presenter?.updateView(for: sender.text)
    }
    
    func dropDown(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        collegeSelector.endEditing()
    }
}
