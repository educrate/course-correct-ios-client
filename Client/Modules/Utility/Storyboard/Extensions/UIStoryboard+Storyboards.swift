//
//  UIStoryboard+Storyboards.swift
//  Client
//
//  Created by Ampe on 10/9/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit


// MARK: - Storyboard Conformance
extension UIStoryboard {
    enum Storyboard: String {
        
        // MARK: Main App
        case launchScreen = "LaunchScreen"
        case main = "Main"
        case welcome = "Welcome"
        case selectCollege = "SelectCollege"
        case enterStudentIdentifier = "EnterStudentIdentifier"
        case enterAccessCode = "EnterAccessCode"
        case createPassword = "CreatePassword"
        
        case profileOverview = "ProfileOverview"
        case profileAccount = "ProfileAccount"
        
        // MARK: Modules
        case uiDropdown = "UIDropdown"
        case uiField = "UIField"
        case uiInlinePicker = "UIInlinePicker"
    }
}

// MARK: - Convenience Initializers
extension UIStoryboard {
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
}


// MARK: - Class Functions
extension UIStoryboard {
    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
    }
}


// MARK: - View Controller Instantiation from Generics
extension UIStoryboard {
    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}

// MARK: - Table View Cell Instantiation from Generics
extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.storyboardIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.storyboardIdentifier)")
        }
        
        return cell
    }
}

// MARK: - Collection View Cell Instantiation from Generics
extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.storyboardIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.storyboardIdentifier)")
        }
        
        return cell
    }
}

extension UIStoryboardSegue {
    func viewController<T: UIViewController>() -> T {
        guard let viewController = destination as? T else {
            fatalError("Cannot segue to: \(T.self) with identifier: \(T.storyboardIdentifier)")
        }
        
        return viewController
    }
}
