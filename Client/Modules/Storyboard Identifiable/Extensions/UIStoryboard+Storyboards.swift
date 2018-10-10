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
        case launchScreen
        case main
        case collegeSelector
    }
}


// MARK: - Storyboard Helpers
extension UIStoryboard.Storyboard {
    var filename: String {
        return rawValue.capitalized
    }
}


// MARK: - Convenience Initializers
extension UIStoryboard {
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
}


// MARK: - Class Functions
extension UIStoryboard {
    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
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
