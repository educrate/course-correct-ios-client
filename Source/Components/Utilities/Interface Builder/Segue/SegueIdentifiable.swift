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
