//
//  UIDropDownViewDelegate.swift
//  Client
//
//  Created by Ampe on 11/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

protocol UIDropDownViewDelegate: class {
    func inputChanged(_ sender: UITextField)
    func dropDown(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}