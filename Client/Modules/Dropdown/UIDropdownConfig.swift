//
//  UIDropdownConfig.swift
//  UIDropdown
//
//  Created by Ampe on 7/30/18.
//

import UIKit

public struct UIDropdownConfig {
    public let flatFieldHeight: CGFloat
    public let dropdownCellHeight: CGFloat
    public let numberOfResults: Int
    public let numberOfSections: Int
    public let cellReuseIdenfier: String
    
    public init(flatFieldHeight: CGFloat,
                dropdownCellHeight: CGFloat,
                numberOfResults: Int,
                numberOfSections: Int,
                cellReuseIdenfier: String = UIDropdownConfig.default.cellReuseIdenfier) {
        
        self.flatFieldHeight = flatFieldHeight
        self.dropdownCellHeight = dropdownCellHeight
        self.numberOfResults = numberOfResults
        self.numberOfSections = numberOfSections
        self.cellReuseIdenfier = cellReuseIdenfier
    }
    
    public static let `default` = UIDropdownConfig(flatFieldHeight: 50,
                                                     dropdownCellHeight: 50,
                                                     numberOfResults: 5,
                                                     numberOfSections: 1,
                                                     cellReuseIdenfier: UIDropdownCell.reuseIdentifier)
}
