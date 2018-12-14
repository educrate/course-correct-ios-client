//
//  UIStoryboard+StoryboardIdentifiable.swift
//  Client
//
//  Created by Ampe on 12/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

// MARK: View Controller Instantiation from Generics
extension UIStoryboard {
    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}
