//
//  AddLocationError.swift
//  Client
//
//  Created by Ampe on 12/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

enum AddLocationError: Error {
    case autocompleteNotLoaded
}

extension AddLocationError: ClientReadable {
    var message: String {
        return "Something went wrong retrieving the list of potential addresses."
    }
}
