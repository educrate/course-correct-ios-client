//
//  ProfileAccountViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileAccountViewController: UITableViewController, ProfileAccountViewProtocol {
	var presenter: ProfileAccountPresenterProtocol?
    
    // MARK: Views
    private weak var coursePicker: UIInlinePickerViewController!
    
    deinit {
        print("deinitialized profile account screen")
    }
}

// MARK: - Controller Lifecycle
extension ProfileAccountViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueCase(for: segue) {
        case .inlinePicker:
            coursePicker = segue.viewController()
            coursePicker.setOptions(["Physics 7C",
                                     "Chem 1A",
                                     "Java 13B",
                                     "Math 3D",
                                     "Python 101",
                                     "Psychology 12C",
                                     "Biology 93"])
        }
    }
}

extension ProfileAccountViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case CellType.courses.rawValue:
            return 120
        case CellType.name.rawValue:
            return 60
        case CellType.email.rawValue:
            return 60
        case CellType.studentIdenfier.rawValue:
            return 60
        case CellType.areaOfStudy.rawValue:
            return 60
        case CellType.classOf.rawValue:
            return 60
        case CellType.profilePicture.rawValue:
            return 100
        default:
            return 0
        }
    }
}

extension ProfileAccountViewController: SegueIdentifiable {
    enum Segue: String {
        case inlinePicker = "InlinePicker"
    }
}

private extension ProfileAccountViewController {
    enum CellType: Int {
        case courses = 0
        case name
        case email
        case studentIdenfier
        case areaOfStudy
        case classOf
        case profilePicture
    }
}
