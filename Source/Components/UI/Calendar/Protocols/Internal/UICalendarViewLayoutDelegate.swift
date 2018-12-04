//
//  UICalendarViewLayoutDelegate.swift
//  Client
//
//  Created by Ampe on 12/3/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

protocol UICalendarViewLayoutDelegate: class {
    func heightForCell(_ eventCount: Int) -> CGFloat
}