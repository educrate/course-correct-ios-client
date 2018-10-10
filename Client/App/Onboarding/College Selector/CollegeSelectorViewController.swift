//
//  CollegeSelectorViewController.swift
//  Client
//
//  Created Ampe on 10/9/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CollegeSelectorViewController: UIViewController, CollegeSelectorViewProtocol {
	
    // MARK: Viper
    
    var presenter: CollegeSelectorPresenterProtocol?
    
    
    // MARK: Views
    
    @IBOutlet
    weak var collegeSelector: UIDropdownView!
}
