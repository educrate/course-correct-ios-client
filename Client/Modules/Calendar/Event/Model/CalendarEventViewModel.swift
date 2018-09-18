//
//  CalendarEventViewModel.swift
//  Client
//
//  Created by Ampe on 9/17/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import UIKit

protocol CalendarEventViewModel {
    init(_ event: CalendarEvent)
    
    var title: String? { get }
    var detail: String? { get }
    
    var leftLogo: UIImage? { get set }
    var rightLogo: UIImage? { get set }
    
    var courseName: String { get set }
    var tutorName: String { get set }
    var tuteeName: String { get set }
    var formattedDuration: String { get set }
    var locationName: String { get set }
}
