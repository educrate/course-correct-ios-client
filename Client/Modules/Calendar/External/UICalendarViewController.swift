//
//  CalendarView.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import UIKit

class UICalendarViewController: UIViewController {
    
    
    // MARK: Properties
    
    var brain: CalendarBrain = .default
    
    
    // MARK: Views
    
    /// encompasing table view which holds
    /// the date object as well as the
    /// table view for a single day
    @IBOutlet
    weak var collectionView: UICollectionView!
    
    
    // MARK: Protocols
    var delegate: UICalendarViewDelegate?
    var dataSource: UICalendarViewDataSource?
}


extension UICalendarViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moveTo(CalendarConfiguration.default.startDate,
               animated: false)
    }
}


// MARK: - Public Update Methods

extension UICalendarViewController {
    func moveTo(_ newDate: Date,
                animated: Bool = true) {
        
        guard let indexPath = brain.dataSource.indexPath(for: newDate) else {
            return
        }
        
        collectionView.layoutIfNeeded()
        
        collectionView.scrollToItem(at: indexPath,
                                    at: .top,
                                    animated: animated)
    }
}


// MARK: - Table View Data Source Conformation

extension UICalendarViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return brain.dataSource.monthCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let dayCount = brain.dataSource.days(in: section) else {
            assert(false, "apple api for date extraction has failed")
            return 0
        }
        
        return dayCount
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let dayHelper = brain.dataSource.day(from: indexPath)
        
        guard
            let dateHelper = brain.dataSource.calendarDate(for: dayHelper),
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICalendarViewCell.identifier,
                                                            for: indexPath) as? UICalendarViewCell
        else {
            return UICollectionViewCell()
        }
        
        guard
            let dataSource = dataSource,
            let day = dataSource.day(for: dateHelper)
        else {
            let day = CalendarDay(date: dateHelper,
                                  events: [])
            cell.setUp(day,
                       calendarLayoutCalculator: brain.layoutCalculator)
            
            return cell
        }
        
        cell.setUp(day,
                   calendarLayoutCalculator: brain.layoutCalculator)
        
        return cell
    }
}

extension UICalendarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let dayHelper = brain.dataSource.day(from: indexPath)
        
        guard
            let dateHelper = brain.dataSource.calendarDate(for: dayHelper),
            let dataSource = dataSource,
            let day = dataSource.day(for: dateHelper)
        else {
            return CGSize(width: collectionView.bounds.width,
                          height: 75)
        }
        
        let eventCount = day.events.count
        let numberOfCellSpaces = eventCount - 1
        let heightOfCellSpaces = CGFloat(numberOfCellSpaces * 8)
        let minutes = day.events.reduce(0, { $0 + $1.duration } )
        let heightOfEvents = CGFloat(brain.layoutCalculator.height(for: minutes))
        let totalHeight = heightOfCellSpaces + heightOfEvents
    
        return CGSize(width: collectionView.bounds.width,
                      height: totalHeight)
    }
}


// MARK: - Table View Delegate Conformation

extension UICalendarViewController: UICollectionViewDelegate {}
