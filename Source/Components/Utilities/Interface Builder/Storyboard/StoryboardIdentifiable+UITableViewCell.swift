//
//  StoryboardIdentifiable+UITableViewController.swift
//  Client
//
//  Created by Ampe on 12/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

// MARK: Conforms UITableViewCell to StoryboardIdentifiable
extension UITableViewCell: StoryboardIdentifiable {}

// MARK: Extract Identifier From Reusable Cell
extension StoryboardIdentifiable where Self: UITableViewCell {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
