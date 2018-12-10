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
    
    // MARK: View Outlets
    @IBOutlet private weak var coursePicker: UIInlinePickerView! {
        didSet {
            coursePicker.set(["Physics 7C",
                              "Chem 1A",
                              "Java 13B",
                              "Math 3D",
                              "Python 101",
                              "Psychology 12C",
                              "Biology 93"])
            
            coursePicker.set(UIInlinePickerViewConfiguration(allowsMultipleSelection: true))
        }
    }
    
    deinit {
        print("deinitialized profile account screen")
    }
}

extension ProfileAccountViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case CellType.courses.rawValue:
            return coursePicker.recommendedHeight + 24
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
