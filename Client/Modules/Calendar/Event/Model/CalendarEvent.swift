//
//  CalendarEvent.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import UIKit

protocol CalendarEvent {
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

extension CalendarEvent {
    func title() -> String {
        return "\(courseName) with \(tutorName)"
    }
    
    func detail() -> String {
        return "\(formattedDuration) at \(locationName)"
    }
}
