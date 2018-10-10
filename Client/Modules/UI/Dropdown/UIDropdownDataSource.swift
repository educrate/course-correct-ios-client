//
//  UIDropdownDataSource.swift
//  UIDropdown
//
//  Created by Ampe on 7/30/18.
//

import Foundation

protocol UIDropdownDataSource {
    // MARK: Storage
    var data: [String] { get set }
    
    // MARK: Get Methods
    func numberOfRows() -> Int
    func text(for row: Int) -> String
    
    // MARK: Set Methods
}

extension UIDropdownDataSource {
    func numberOfRows() -> Int {
        return data.count
    }
    
    func text(for row: Int) -> String {
        guard numberOfRows() >= row + 1 else {
            return ""
        }
        
        return data[row]
    }
}
