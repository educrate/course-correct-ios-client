//
//  CalendarViewController.swift
//  Client
//
//  Created by Ampe on 9/26/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

protocol CalendarViewController {
    var cache: CalendarViewCache? { get set }
    var delegate: CalendarViewDelegate? { get set }
    var dataSource: CalendarViewDataSource? { get set }
    
    var minimumDay: CalendarDay { get set }
    var currentDay: CalendarDay { get set }
    var maximumDay: CalendarDay { get set }
    
    
}
