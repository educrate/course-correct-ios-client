//
//  XIBIdentifiable+Self.swift
//  Client
//
//  Created by Ampe on 12/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

extension XIBIdentifiable where Self: XIBView {
    static var xibIdentifier: String {
        return String(describing: self)
    }
}
