//
//  XIBIdentifiable.swift
//  Client
//
//  Created by Christian Ampe on 11/12/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

// MARK: - Protocol Requiring an Identifier
protocol XIBIdentifiable {
    static var xibIdentifier: String { get }
}

extension XIBView: XIBIdentifiable {}

// MARK: Extract Identifier From View Controller
extension XIBIdentifiable where Self: XIBView {
    static var xibIdentifier: String {
        return String(describing: self)
    }
}
