//
//  UICalendarViewDataControllerDelegate.swift
//  Client
//
//  Created by Ampe on 12/5/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

protocol UICalendarViewDataControllerDelegate: class {
    func insert(_ indexPaths: [IndexPath])
    func remove(_ indexPaths: [IndexPath])
    
    func reload(_ sections: IndexSet)
}
