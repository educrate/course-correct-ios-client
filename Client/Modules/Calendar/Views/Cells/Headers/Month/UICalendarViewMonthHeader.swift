//
//  UICalendarViewMonthHeader.swift
//  Client
//
//  Created by Ampe on 10/2/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import UIKit

class UICalendarViewMonthHeader: UICollectionReusableView {
    @IBOutlet
    weak var monthLabel: UILabel!
}

extension UICalendarViewMonthHeader {
    func setup(_ month: String) {
        monthLabel.text = month
    }
}

extension UICalendarViewMonthHeader {
    static let identifier = "uicalendarviewmonthheader"
}
