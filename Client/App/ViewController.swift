//
//  ViewController.swift
//  Client
//
//  Created by Ampe on 9/18/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import UIKit

struct CalendarDayLabelVM: CalendarViewDayLabelViewModel {
    let title: String?
    let detail: String?
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var calendarDayLabel: CalendarViewDayLabel!
    
    
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let vm = CalendarDayLabelVM(title: "19", detail: "Tue")
        calendarDayLabel.setUp(vm)
    }
}
