//
//  SegueIdentifiable.swift
//  Client
//
//  Created by Christian Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

protocol SegueIdentifiable {
    associatedtype Segue: RawRepresentable
    
    func segueCase(for segue: UIStoryboardSegue) -> Segue
}

extension SegueIdentifiable where Self: UIViewController, Segue.RawValue == String {
    func segueCase(for segue: UIStoryboardSegue) -> Segue {
        guard let identifier = segue.identifier, let identifierCase = Segue(rawValue: identifier) else {
            fatalError("Could not map segue identifier - \(String(describing: segue.identifier)) - to segue case")
        }
        
        return identifierCase
    }
}
