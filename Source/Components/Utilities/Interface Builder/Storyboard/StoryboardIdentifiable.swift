//
//  StoryboardIdentifiable.swift
//  Client
//
//  Created by Christian Ampe on 9/4/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Protocol Requiring an Identifier
protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}
