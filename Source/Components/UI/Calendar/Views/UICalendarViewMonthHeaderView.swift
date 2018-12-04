//
//  UICalendarViewMonthHeaderView.swift
//  Client
//
//  Created by Christian Ampe on 10/2/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UICalendarViewMonthHeaderView: UICollectionReusableView {
    
    // MARK: View Outlets
    @IBOutlet weak var monthLabel: UILabel!
    
    // MARK: View Properties
    private var monthName: String?
}

extension UICalendarViewMonthHeaderView {
    func set(_ month: String) {
        monthName = month
    }
    
    func reload() {
        guard let month = monthName else {
            return
        }
        
        monthLabel.text = month
    }
}
