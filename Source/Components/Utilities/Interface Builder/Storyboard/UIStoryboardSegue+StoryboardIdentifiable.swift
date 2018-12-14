//
//  UIStoryboardSegue+StoryboardIdentifiable.swift
//  Client
//
//  Created by Ampe on 12/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

extension UIStoryboardSegue: StoryboardIdentifiable {}

extension StoryboardIdentifiable where Self: UIStoryboardSegue {
    static var storyboardIdentifier: String {
        return String(describing: self)
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
