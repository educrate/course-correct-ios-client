//
//  CreateEventViewController.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreateEventDateHelper {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM d, h:mm a"
        return dateFormatter
    }()
    
    static func formattedDuration(for timeInterval: TimeInterval) -> String {
        let durations = duration(for: timeInterval)
        let hours = durations.hours
        let minutes = durations.minutes
        return "\(hours) Hr \(minutes) Min"
    }
    
    static func duration(for timeInterval: TimeInterval) -> (hours: Int, minutes: Int) {
        let hours = Int(timeInterval / 3600)
        let minutes = (Int(timeInterval) % 3600) / 60
        return (hours, minutes)
    }
    
    static func formattedDate(for date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}

class CreateEventViewController: UITableViewController, CreateEventViewProtocol {
	
    // MARK: Viper
    var presenter: CreateEventPresenterProtocol?
    
    // MARK: Views
    @IBOutlet private weak var courseInlinePicker: UIInlinePickerView! {
        didSet {
            courseInlinePicker.set(["Physics 7C",
                                    "Chemistry 1A",
                                    "Python 101",
                                    "Bio 93"])
        }
    }
    
    // MARK: - View Outlets
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var timePicker: UIDatePicker!

    @IBOutlet private weak var dateLabel: UITextField!
    @IBOutlet private weak var timeLabel: UITextField!
    
    // MARK: Deinitializer Verification
    deinit {
        print("deinitialized create event screen")
    }
}

extension CreateEventViewController {
    @IBAction func datePickerSelectedValue(_ sender: UIDatePicker, forEvent event: UIEvent) {
        dateLabel.text = CreateEventDateHelper.formattedDate(for: sender.date)
    }
    
    @IBAction func timePickerSelectedValue(_ sender: UIDatePicker, forEvent event: UIEvent) {
        timeLabel.text = CreateEventDateHelper.formattedDuration(for: sender.countDownDuration)
    }
}

extension CreateEventViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // if index path is a header view do nothing
        guard indexPath.row == 0 else {
            return
        }
        
        // switch on index and perform anticipated operation
        switch indexPath.section {
        case CellType.selectCourse.rawValue:
            tableView.beginUpdates()
            tableView.endUpdates()
        case CellType.addDate.rawValue:
            tableView.beginUpdates()
            tableView.endUpdates()
        case CellType.addDuration.rawValue:
            tableView.beginUpdates()
            tableView.endUpdates()
        case CellType.addLocation.rawValue:
            presenter?.pressedAddLocation()
        case CellType.selectTutor.rawValue:
            presenter?.pressedSelectTutor()
        default:
            return
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // if is initial cell in section set height to 100
        if indexPath.row == 0 {
            return 100
        }
        
        let previousIndexPath = IndexPath(row: indexPath.row - 1, section: indexPath.section)
        
        // if the previous cell in the section is selected we know that we should expand the next cell
        guard let previousCell = tableView.cellForRow(at: previousIndexPath), previousCell.isSelected else {
            return 0
        }
        
        // switch on index and set hardcoded height value
        switch indexPath.section {
        case CellType.selectCourse.rawValue:
            return courseInlinePicker.recommendedHeight
        case CellType.addDate.rawValue:
            return 160
        case CellType.addDuration.rawValue:
            return 160
        default:
            return 0
        }
    }
}

extension CreateEventViewController: SegueIdentifiable {
    enum Segue: String {
        case inlinePicker = "InlinePicker"
    }
}

private extension CreateEventViewController {
    enum CellType: Int {
        case selectCourse = 0
        case addDate
        case addDuration
        case addLocation
        case selectTutor
    }
}
