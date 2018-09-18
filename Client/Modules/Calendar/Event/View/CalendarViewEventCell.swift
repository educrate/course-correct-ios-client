//
//  CalendarViewEventCell.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import UIKit

public class CalendarViewEventCell: UITableViewCell {
    private var title: UILabel?
    private var detail: UILabel?
    private var leftIcon: UIImage?
    private var rightIcon: UIImage?
}

extension CalendarViewEventCell {
    func initalize(_ eventViewModel: CalendarEventViewModel) {
        title?.text = eventViewModel.title
        detail?.text = eventViewModel.detail
        leftIcon = eventViewModel.leftLogo
        rightIcon = eventViewModel.rightLogo
    }
}
