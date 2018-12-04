//
//  UICalendarViewDateDataSource.swift
//  Client
//
//  Created by Ampe on 12/3/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

protocol UICalendarViewDateDataSource: class {
    func numberOfMonths() -> Int
    func numberOfDays(in section: Int) -> Int
    func components(for indexPath: IndexPath) -> UICalendarViewDateComponents
    func descriptions(for components: UICalendarViewDateComponents) -> UICalendarViewDateDescription?
}
