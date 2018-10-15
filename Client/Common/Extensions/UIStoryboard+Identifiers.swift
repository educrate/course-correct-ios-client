//
//  UIStoryboard+Identifiers.swift
//  Client
//
//  Created by Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

// MARK: - Storyboard Conformance
extension UIStoryboard {
    enum Storyboard: String {
        
        // MARK: Entry
        case appLaunch = "AppLaunch"
        case app = "App"
        case welcome = "Welcome"
        
        // MARK: Onboarding
        case selectCollege = "SelectCollege"
        case enterStudentIdentifier = "EnterStudentIdentifier"
        case enterAccessCode = "EnterAccessCode"
        case createPassword = "CreatePassword"
        
        // MARK: Schedule
        case calendar = "Calendar"
        case event = "Event"
        
        // MARK: Create Event
        case newEvent = "NewEvent"
        case addLocation = "AddLocation"
        case selectTutor = "SelectTutor"
        case tutorProfile = "TutorProfile"
        
        // MARK: Profile
        case profileOverview = "ProfileOverview"
        case profileAccount = "ProfileAccount"
        case profilePayment = "ProfilePayment"
        case profileSupport = "ProfileSupport"
        
        // MARK: Modules
        case uiDropdown = "UIDropdown"
        case uiField = "UIField"
        case uiInlinePicker = "UIInlinePicker"
    }
}
