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


// MARK: - View Controller

// MARK: Conforms UIViewController to StoryboardIdentifiable
extension UIViewController: StoryboardIdentifiable {}

// MARK: Extract Identifier From View Controller
extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

// MARK: View Controller Instantiation from Generics
extension UIStoryboard {
    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}


// MARK: - Table View Cell

// MARK: Conforms UITableViewCell to StoryboardIdentifiable
extension UITableViewCell: StoryboardIdentifiable {}

// MARK: Extract Identifier From Reusable Cell
extension StoryboardIdentifiable where Self: UITableViewCell {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

// MARK: Table View Cell Instantiation from Generics
extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.storyboardIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.storyboardIdentifier)")
        }
        
        return cell
    }
}


// MARK: - Collection View

// MARK: Conforms UICollectionViewCell to StoryboardIdentifiable
extension UICollectionViewCell: StoryboardIdentifiable {}

// MARK: Extract Identifier From Reusable Cell
extension StoryboardIdentifiable where Self: UICollectionViewCell {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

// MARK: Collection View Cell Instantiation from Generics
extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.storyboardIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.storyboardIdentifier)")
        }
        
        return cell
    }
}


// MARK: - Segues

// MARK: Conforms UIStoryboardSegue to StoryboardIdentifiable
extension UIStoryboardSegue: StoryboardIdentifiable {}

// MARK: Extract Identifier From Reusable Cell
extension StoryboardIdentifiable where Self: UIStoryboardSegue {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

// MARK: View Controller Validation from Generics
extension UIStoryboardSegue {
    func viewController<T: UIViewController>() -> T {
        guard let viewController = destination as? T else {
            fatalError("Cannot segue to: \(T.self) with identifier: \(T.storyboardIdentifier)")
        }
        
        return viewController
    }
}
