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
    
    /// The identifier used to describe
    /// the associated xib file.
    static var xibIdentifier: String { get }
}

// MARK: - XIB Identifiable Conformation
extension XIBView: XIBIdentifiable {}

// MARK: - Extract Identifier From View Controller
extension XIBIdentifiable where Self: XIBView {
    
    /// Default value set from the Swift generated
    /// description of the view.
    static var xibIdentifier: String {
        return String(describing: self)
    }
}
