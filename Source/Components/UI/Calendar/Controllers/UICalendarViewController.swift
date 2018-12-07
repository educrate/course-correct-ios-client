//
//  UICalendarViewController.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class UICalendarViewController {
    let dataSource: UICalendarViewDataController
    let layoutDelegate: UICalendarViewLayoutController
    
    init(configuration: UICalendarViewConfiguration = .default) {
        dataSource = UICalendarViewDataController()
        layoutDelegate = UICalendarViewLayoutController(heightInPixelsOfOneHour: configuration.layoutConfiguration.heightInPixelsOfOneHour)
    }
}

extension UICalendarViewController {
    static let `default` = UICalendarViewController()
}
