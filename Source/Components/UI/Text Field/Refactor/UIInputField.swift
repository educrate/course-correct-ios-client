//
//  UIInputField.swift
//  Client
//
//  Created by Ampe on 11/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

final class UIInputField: UITextField {
    
    // MARK: View Outlets
    @IBOutlet private weak var underline: UIView!
    
    // MARK: Constraint Outlets
    @IBOutlet private weak var underlineHeightConstraint: NSLayoutConstraint!
}
