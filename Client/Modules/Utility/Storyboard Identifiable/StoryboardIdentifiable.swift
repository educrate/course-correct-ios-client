//
//  StoryboardIdentifier.swift
//  AHStoryboard
//
//  Created by Andyy Hope on 19/01/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit


// MARK: - Protocol Requiring an Identifier
protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}


// MARK: - Extract Identifier From View Controller
extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

// MARK: - Extract Identifier From Reusable Cell
extension StoryboardIdentifiable where Self: UITableViewCell {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

// MARK: - Extract Identifier From Reusable Cell
extension StoryboardIdentifiable where Self: UIStoryboardSegue {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
