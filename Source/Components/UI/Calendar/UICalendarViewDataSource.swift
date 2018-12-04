//
//  UICalendarViewDataSource.swift
//  Client
//
//  Created by Christian Ampe on 10/2/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

protocol UICalendarViewDataSource: class {
    func events(for components: UICalendarViewDateComponents) -> [UICalendarViewEvent]
}
