//
//  CalendarEventViewModel.swift
//  Client
//
//  Created by Ampe on 9/17/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

protocol CalendarEventViewModel {
    func title() -> String?
    func detail() -> String?
    
    var leftLogo: UIImage? { get set }
    var rightLogo: UIImage? { get set }
    
    var courseName: String { get set }
    var tutorName: String { get set }
    var tuteeName: String { get set }
    var formattedDuration: String { get set }
    var locationName: String { get set }
}

extension CalendarEventViewModel {
    func title() -> String {
        return "\(courseName) with \(tutorName)"
    }
    
    func detail() -> String {
        return "\(formattedDuration) at \(locationName)"
    }
}
