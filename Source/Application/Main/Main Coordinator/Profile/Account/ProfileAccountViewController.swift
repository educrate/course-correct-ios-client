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
    @IBOutlet private weak var coursePicker: UIInlinePickerView!
    
    deinit {
        print("deinitialized profile account screen")
    }
}

extension ProfileAccountViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        coursePicker.set(UIInlinePickerViewConfiguration(allowsMultipleSelection: true))
        coursePicker.set(["Physics 7C",
                          "Chem 1A",
                          "Java 13B",
                          "Math 3D",
                          "Python 101",
                          "Psychology 12C",
                          "Biology 93"])
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ProfileAccountViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case CellType.courses.rawValue:
            return coursePicker.recommendedHeight + 4 + 14.33 + 4 + 20
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
            return 88.33
        default:
            return 0
        }
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
