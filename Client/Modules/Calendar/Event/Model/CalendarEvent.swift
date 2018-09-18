//
//  CalendarEvent.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import UIKit

protocol CalendarEvent {
    var course: CalendarCourse { get set }
    var tutor: CalendarTutor { get set }
    var tutee: CalendarTutee { get set }
    var location: CalendarLocation { get set }
    var eventState: CalendarEventState { get set }
    var startDate: Date { get set }
    var endDate: Date { get set }
}
