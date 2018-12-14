//
//  UICollectionReusableView+StoryboardIdentifiable.swift
//  Client
//
//  Created by Ampe on 12/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

extension UICollectionReusableView: StoryboardIdentifiable {}

extension StoryboardIdentifiable where Self: UICollectionReusableView {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
