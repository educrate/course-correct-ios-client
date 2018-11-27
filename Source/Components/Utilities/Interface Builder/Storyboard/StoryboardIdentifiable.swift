//
//  StoryboardIdentifiable.swift
//  Client
//
//  Created by Christian Ampe on 9/4/18.
//  Copyright © 2018 Educrate. All rights reserved.
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
    
    func register<T: UITableViewCell>(xibCell: T.Type) {
        register(UINib(nibName: T.storyboardIdentifier, bundle: nil), forCellReuseIdentifier: T.storyboardIdentifier)
    }
}


// MARK: - Collection View

// MARK: Conforms UICollectionViewCell to StoryboardIdentifiable
extension UICollectionReusableView: StoryboardIdentifiable {}

// MARK: Extract Identifier From Reusable Cell
extension StoryboardIdentifiable where Self: UICollectionReusableView {
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
    
    func dequeueHeaderView<T: UICollectionReusableView>(for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.storyboardIdentifier, for: indexPath) as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.storyboardIdentifier)")
        }
        
        return view
    }
    
    func register<T: UICollectionViewCell>(xibCell: T.Type) {
        register(UINib(nibName: T.storyboardIdentifier, bundle: nil), forCellWithReuseIdentifier: T.storyboardIdentifier)
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
