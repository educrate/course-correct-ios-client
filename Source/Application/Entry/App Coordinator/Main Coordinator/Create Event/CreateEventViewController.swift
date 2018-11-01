//
//  CreateEventViewController.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreateEventViewController: UITableViewController, CreateEventViewProtocol {
	
    // MARK: Viper
    var presenter: CreateEventPresenterProtocol?
    
    // MARK: Views
    @IBOutlet private weak var courseInlinePicker: UIInlinePickerViewController!
    
    // MARK: Deinitializer Verification
    deinit {
        print("deinitialized create event screen")
    }
}

extension CreateEventViewController {    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueCase(for: segue) {
        case .inlinePicker:
            courseInlinePicker = segue.viewController()
            courseInlinePicker.setOptions(["Physics 7C", "Chemistry 1A", "Python 101", "Bio 93"])
        }
    }
}

extension CreateEventViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
}

extension CreateEventViewController: SegueIdentifiable {
    enum Segue: String {
        case inlinePicker = "InlinePicker"
    }
}

private extension CreateEventViewController {
    private enum CellType: Int {
        case selectCourse = 1
        case addDate
        case addDuration
        case addLocation
        case selectTutor
    }
}
