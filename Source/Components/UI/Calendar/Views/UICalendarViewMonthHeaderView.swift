//
//  UICalendarViewMonthHeaderView.swift
//  Client
//
//  Created by Christian Ampe on 10/2/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

/// This header view contains the necessary information
/// to display the month and year description to the user.
final class UICalendarViewMonthHeaderView: UICollectionReusableView {
    
    // MARK: - View Outlets
    @IBOutlet weak var monthLabel: UILabel!
    
    // MARK: - View Properties
    private var monthName: String?
}

// MARK: - Public Setup Methods
extension UICalendarViewMonthHeaderView {
    
    /// Method used for setting the month's description property.
    ///
    /// - Parameter monthName: Contains the description of the current month.
    func set(_ monthName: String) {
        self.monthName = monthName
    }
    
    /// Method used to reload all inputs on the cell.
    /// Call after setting the event or configuration.
    func reload() {
        guard let monthName = monthName else {
            return
        }
        
        monthLabel.text = monthName
    }
}
