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
        
        // if index path is a header view do nothing
        guard indexPath.row == 0 else {
            return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // if is initial cell in section set height to 50
        if indexPath.row == 0 {
            return 100
        }
        
        let previousIndexPath = IndexPath(row: indexPath.row - 1, section: indexPath.section)
        
        // if the previous cell in the section is selected we know that we should expand the next cell
        guard let previousCell = tableView.cellForRow(at: previousIndexPath), previousCell.isSelected else {
            return 0
        }
        
        // switch on index and set hardcoded value
        switch indexPath.section {
        case CellType.selectCourse.rawValue:
            return courseInlinePicker.recommendedHeight
        case CellType.addDate.rawValue:
            return 160
        case CellType.addDuration.rawValue:
            return 160
        default:
            return 0
        }
    }
}

extension CreateEventViewController: SegueIdentifiable {
    enum Segue: String {
        case inlinePicker = "InlinePicker"
    }
}

private extension CreateEventViewController {
    private enum CellType: Int {
        case selectCourse = 0
        case addDate
        case addDuration
        case addLocation
        case selectTutor
    }
}
