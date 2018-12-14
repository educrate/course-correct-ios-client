//
//  StoryboardIdentifiable+UIViewController.swift
//  Client
//
//  Created by Ampe on 12/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

// MARK: Conforms UIViewController to StoryboardIdentifiable
extension UIViewController: StoryboardIdentifiable {}

// MARK: Extract Identifier From View Controller
extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
