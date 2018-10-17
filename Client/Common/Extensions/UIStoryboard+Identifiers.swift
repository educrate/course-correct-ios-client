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
        
        // MARK: Onboarding New User
        case selectCollege = "SelectCollege"
        case enterStudentIdentifier = "EnterStudentIdentifier"
        case enterAccessCode = "EnterAccessCode"
        case createPassword = "CreatePassword"
        
        // MARK: Onboarding Existing User
        case signIn = "SignIn"
        
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
        case uiActionSheet = "UIActionSheet"
    }
}

// MARK: - Convenience Initializers
extension UIStoryboard {
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
}


// MARK: - Class Functions
extension UIStoryboard {
    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
    }
}
