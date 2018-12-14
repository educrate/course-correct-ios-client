//
//  UITableViewController+StoryboardIdentifiable.swift
//  Client
//
//  Created by Ampe on 12/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

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
