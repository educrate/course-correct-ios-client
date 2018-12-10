//
//  SelectCollegeError.swift
//  Client
//
//  Created by Christian Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

enum SelectCollegeError: Error {
    case collegesNotLoaded
    case noCollegeSelected
    case invalidCollege
}

extension SelectCollegeError: ClientReadable {
    var message: String {
        switch self {
        case .collegesNotLoaded:
            return "Something went wrong retrieving the list of colleges."
        case .noCollegeSelected:
            return "Please select a college before continuing on."
        case .invalidCollege:
            return "This college is currently unsupported through our application."
        }
    }
}
